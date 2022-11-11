require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/content_for'
require 'tilt/erubis'

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret'
end

get "/" do
  @files = Dir.glob(root + "/data/*")
              .map{ |path| File.basename(path) }
  erb :index
end

get "/:filename" do
  file_path = root + "/data/" + params[:filename]

  if File.file?(file_path)
    send_file file_path, :type => :txt
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end
