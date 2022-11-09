require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/content_for'
require 'tilt/erubis'

get "/" do
  @documents = Dir.entries("/home/yenseow/ls/rb175/cms/public/documents/*")
  erb :index, layout: :layout
end