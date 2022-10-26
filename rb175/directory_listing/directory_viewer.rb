require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @file_names = Dir.glob("public/*").map{ |name| File.basename(name) }.sort

  @file_names.reverse! if params[:order] == 'desc'

  erb :home
end
