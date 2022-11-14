require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/content_for'
require 'tilt/erubis'
require 'redcarpet' # renders markdown files

configure do
  enable :sessions
  set :session_secret, 'secret'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)

  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def signed_in?
  session[:username]
end

def sign_in_required
  unless signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

# Homepage
get "/" do
    pattern = File.join(data_path, "*") # ../data/*
    @files = Dir.glob(pattern).map{ |path| File.basename(path) }
    erb :index
end

# Render sign in form
get "/users/signin" do
  erb :signin
end

# Check credentials, sign user in (or not)
post "/users/signin" do
  if params[:username] == "admin" && params[:password] == "secret"
    session[:username] = params[:username]
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    status 422
    erb :signin
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

# Visit the new document page
get "/new" do
  sign_in_required

  erb :new
end

# Create new file if its name exists
post "/new" do
  sign_in_required

  file_name = params[:file_name].strip

  if file_name.empty? || File.extname(file_name).length <= 1
    session[:message] = "A name and an extension is required."
    status 422
    erb :new
  else
    file_path = File.join(data_path, file_name) # ../data/about.md
    File.write(file_path, params[:content])

    session[:message] = "#{file_name} has been created"
    redirect "/"
  end
end

# Display .txt and .md files
get "/:filename" do
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Render form for editing files
get "/:filename/edit" do
  sign_in_required

  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  if File.exist?(file_path)
    @content = File.read(file_path)
    erb :edit
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Submit edited file
post "/:filename" do
  sign_in_required

  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated"
  redirect "/"
end

# Delete a file
post "/:filename/delete" do
  sign_in_required
  
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted"
  redirect "/"
end
