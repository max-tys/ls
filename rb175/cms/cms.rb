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

# Homepage
get "/" do
  if session[:logged_in]
    pattern = File.join(data_path, "*") # ../data/*
    @files = Dir.glob(pattern).map{ |path| File.basename(path) }
    erb :index
  else
    erb :signin
  end
end

# Render the new document form
get "/new" do
  erb :new
end

# Create new file if its name exists
post "/new" do
  file_name = params[:file_name].strip

  if file_name.empty? || File.extname(file_name).length <= 1
    session[:message] = "A name and an extension is required."
    status 422
    erb :new
  else
    file_path = File.join(data_path, file_name) # ../data/about.md
    File.write(file_path, params[:content])

    session[:message] = "#{file_name} has been created."
    redirect "/"
  end
end

get "/:filename" do
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

get "/:filename/edit" do
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  if File.exist?(file_path)
    @content = File.read(file_path)
    erb :edit
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

post "/:filename" do
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated"
  redirect "/"
end

post "/:filename/delete" do
  file_path = File.join(data_path, params[:filename]) # ../data/about.md

  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted"
  redirect "/"
end
