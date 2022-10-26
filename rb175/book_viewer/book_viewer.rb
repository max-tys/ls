require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @contents = File.read("data/toc.txt").split("\n")

  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @contents = File.read("data/toc.txt").split("\n")
  @chapter = File.read("data/chp1.txt")

  erb :chapter
end
