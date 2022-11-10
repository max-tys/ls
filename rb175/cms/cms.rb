require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/content_for'
require 'tilt/erubis'

get "/" do
  @documents = Dir.glob("/home/yenseow/ls/rb175/cms/public/documents/*").map{ |name| File.basename(name) }
  erb :index, layout: :layout
end