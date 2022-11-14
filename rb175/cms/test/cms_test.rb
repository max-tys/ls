ENV["RACK_ENV"] = "test"

require "fileutils"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path) # ../test/data
  end

  def teardown
    # remove directory and al its contents
    FileUtils.rm_rf(data_path) # ../test/data
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file| # # ../test/data/about.md
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end
  
  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, %q(<a href="/users/signin">Sign In</a>)
  end

  def test_viewing_text_document
    create_document "changes.txt", "The first major release after 3.0, Ruby 3.1 mostly dedicated to stabilizing new features like concurrency and pattern-matching, but also introduces a bunch of new features."

    get "/changes.txt"
    
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "first major release after 3.0"
  end

  def test_viewing_markdown_document
    create_document "about.md", "# Basic Markdown Syntax"

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Basic Markdown Syntax</h1>"
  end

  def test_document_not_found
    get "/nonexistent.ext" # Attempt to see a non-existent file
    assert_equal 302, last_response.status # Assert that user was redirected
    assert_equal "nonexistent.ext does not exist.", session[:message]
  end

  def test_edit_document_form
    create_document "about.md"

    get "/about.md/edit"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_updating_document
    post "/changes.txt", content: "new content"
    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_view_new_document_form
    get "/new"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_document_with_invalid_name
    post "/new", file_name: ""
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name and an extension is required"

    post "/new", file_name: "test"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name and an extension is required"

    post "/new", file_name: "test."
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name and an extension is required"

    post "/new", file_name: ".test"
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name and an extension is required"
  end

  def test_create_new_document_with_valid_name
    post "/new", file_name: "test.txt"
    assert_equal 302, last_response.status
    assert_equal "test.txt has been created", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_delete_document
    create_document("test.txt")

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "test.txt has been deleted", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="test.txt")
  end

  def test_sign_in_page
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, %q(<input name="username")
    assert_includes last_response.body, %q(<button type="submit">Sign In</button>)
  end

  def test_invalid_login_attempt
    post "/users/signin", username: "", password: ""
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_valid_login_attempt
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin"
  end

  def test_signout
    get "/", {}, { "rack.session" => { username: "admin" } }
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out.", session[:message]
    
    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end
end