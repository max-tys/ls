require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/content_for'
require 'tilt/erubis'

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*")
              .map{ |path| File.basename(path) }
  erb :index
end

get "/:filename" do
  file_path = root + "/data/" + params[:filename]
  send_file file_path, :type => :txt
end