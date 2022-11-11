ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
  end

  def test_viewing_text_document
    get "/history.txt"
    
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert last_response.body.include? "1993 - Yukihiro Matsumoto dreams up Ruby."
    assert last_response.body.include? "2013 - Ruby 2.0 released."
    assert last_response.body.include? "2019 - Ruby 2.7 released."
  end

  def test_document_not_found
    get "/nonexistent.ext" # Attempt to see a non-existent file

    assert_equal 302, last_response.status # Assert that user was redirected

    get last_response["Location"] # Request the page that the user was redirected to

    assert_equal 200, last_response.status
    assert_includes last_response.body, "nonexistent.ext does not exist."

    get "/" # Reload the page
    refute_includes last_response.body, "nonexistent.ext does not exist."
  end

  def test_markdown_document
    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Basic Markdown Syntax</h1>"
  end
end