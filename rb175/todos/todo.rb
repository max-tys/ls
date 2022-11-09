require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/content_for'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, :escape_html => true
end

helpers do
  # Checks whether a given list is completed
    # Condition 1: List contains at least 1 todo
    # Condition 2: All todos are marked as completed
  def list_completed?(list)
    total_todos_count(list) > 0 && 
    remaining_todos_count(list) == 0
  end

  # Count the total number of todos in a list
  def total_todos_count(list)
    list[:todos].size
  end

  # Count the number of incomplete todos in a list
  def remaining_todos_count(list)
    list[:todos].count { |todo| !todo[:completed] }
  end

  # Determine the list class
  def list_class(list)
    "complete" if list_completed?(list)
  end

  # Sort array of lists, uncompleted first
  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_completed?(list) }

    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  # Sort todos in a single list, uncompleted first
  def sort_todos(list, &block)
    complete_todos, incomplete_todos = list[:todos].partition { |todo| todo[:completed] }

    incomplete_todos.each(&block)
    complete_todos.each(&block)
  end
end

# Load list from list id
def load_list(id)
  list = session[:lists].find { |list| list[:id] == id }
  return list if list

  session[:error] = "The specified list was not found."
  redirect "/lists"
end

# Return an error message if list name is invalid.
# Return nil if name is valid.
def error_for_list_name(name)
  if !(1..100).cover? name.length # use cover? instead of include?
    'The list name must be between 1 and 100 characters.'
  elsif session[:lists].any? { |list| list[:name] == name }
    'The list name must be unique.'
  end
end

# Return an error message if todo name is invalid.
# Return nil if name is valid.
def error_for_todo_name(name)
  'The todo name must be between 1 and 100 characters.' unless (1..100).cover? name.length
end

# Returns the next element id
# Increments the largest element id by 1
def next_element_id(elements)
  max = elements.map { |element| element[:id] }.max || 0
  max + 1
end

before do
  session[:lists] ||= []
end

get '/' do
  redirect '/lists'
end

# View all the lists, lists.erb
get '/lists' do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# View the form to make a new list, new_list.erb
get '/lists/new' do
  erb :new_list, layout: :layout
end

# Create a new list, check for invalid inputs
post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    id = next_element_id(session[:lists])
    session[:lists] << { id: id, name: list_name, todos: [] }
    session[:success] = 'The list has been created.'
    redirect '/lists'
  end
end

# View a single list, list.erb
get '/lists/:id' do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :list, layout: :layout
end

# View the form to edit existing list, edit_list.erb
get '/lists/:id/edit' do
  @id = params[:id].to_i
  @list = load_list(@id)
  erb :edit_list, layout: :layout
end

# Rename existing list
post '/lists/:id' do
  list_name = params[:list_name].strip
  @id = params[:id].to_i
  @list = load_list(@id)

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = 'The list has been renamed.'
    redirect "/lists/#{@id}"
  end
end

# Delete a single todo list, list.erb
post '/lists/:id/delete' do
  id = params[:id].to_i
  list = load_list(id)
  session[:lists].delete(list)
  session[:success] = "#{list[:name]} has been deleted."

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    redirect '/lists'
  end
end

# Add a new todo item to a list, check for invalid inputs
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_name = params[:todo].strip

  error = error_for_todo_name(todo_name)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    id = next_element_id(@list[:todos])
    @list[:todos] << { id: id, name: todo_name, completed: false }

    session[:success] = "#{todo_name} has been added to #{@list[:name]}."
    redirect "/lists/#{@list_id}"
  end
end

# Delete a single todo from a list, list.erb
post '/lists/:list_id/todos/:todo_id/delete' do
  list_id = params[:list_id].to_i
  list = load_list(list_id)

  todo_id = params[:todo_id].to_i
  list[:todos].reject! { |todo| todo_id == todo[:id] }

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204 # successful status code
  else
    session[:success] = "#{todo[:name]} has been deleted from #{list[:name]}."
    redirect "/lists/#{list_id}"
  end
end

# Update the status of a todo
post '/lists/:list_id/todos/:todo_id' do
  @list_id = params[:list_id].to_i
  list = load_list(@list_id)

  todo_id = params[:todo_id].to_i
  is_completed = (params[:completed] == 'true')
  todo = list[:todos].find { |todo| todo_id == todo[:id] }
  todo[:completed] = is_completed

  session[:success] = 'The todo has been updated.'
  redirect "/lists/#{@list_id}"
end

# Mark all todos in a given list as completed
post '/lists/:list_id/complete_all' do
  @list_id = params[:list_id].to_i
  list = load_list(@list_id)

  list[:todos].each do |todo|
    todo[:completed] = true
  end
  
  session[:success] = 'All todos have been marked as completed.'
  redirect "/lists/#{@list_id}"
end
