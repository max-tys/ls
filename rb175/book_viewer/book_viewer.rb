require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.read("data/toc.txt").split("\n")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @query = params[:query]

  # redirect to /search if user submits an empty query string.
  redirect "/search" if @query.is_a?(String) && @query.empty?

  @matching_chapters = matching_chapters

  erb :search
end

not_found do
  redirect "/"
end

helpers do
  # input plain text, output html formatted paragraphs
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |para, idx|
      "<p id=#{idx}>#{para}</p>"
    end.join
  end

  # input plain text, output text with highlighted queries
  def highlight_query(text)
    text.gsub(@query, "<mark>#{@query}</mark>")
  end

  # iterates over each chapter and yields its index, title and contents
  def each_chapter
    @contents.each_with_index do |name, index|
      number = index + 1
      contents = File.read("data/chp#{number}.txt")
      yield number, name, contents
    end
  end

  # returns an array of hashes; each hash represents a chapter containing query
  def matching_chapters
    results = []

    # guard against nil queries when user first loads "/search"
    return results unless @query

    each_chapter do |number, name, contents|
      # key is para id, value is para contents
      matching_paragraphs = {}

      # split chapter contents into array of paragraphs
      # populate matching_paragraphs with bolded queries
      contents.split("\n\n").each_with_index do |paragraph, idx|
        if paragraph.include? @query
          matching_paragraphs[idx] = highlight_query(paragraph)
        end
      end

      # populate results array if chapter contains query string
      if contents.include? @query
        results << {
          number: number,
          name: name,
          paragraphs: matching_paragraphs
        }
      end
    end

    results
  end
end