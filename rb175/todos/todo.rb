require 'sinatra'
require 'sinatra/reloader'
require "sinatra/content_for"
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
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

# Clears all lists, lists.erb
get '/lists/clear' do
  session[:lists] = []
  redirect '/lists'
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

# Create a new list, check for invalid inputs
post '/lists' do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = 'The list has been created.'
    redirect '/lists'
  end
end

# View a single list, list.erb
get '/lists/:id' do
  @id = params[:id].to_i
  @list = session[:lists][@id]
  erb :list, layout: :layout
end

# View the form to edit existing list, edit_list.erb
get '/lists/:id/edit' do
  @id = params[:id].to_i
  @list = session[:lists][@id]
  erb :edit_list, layout: :layout
end

# Rename existing list
post '/lists/:id' do
  list_name = params[:list_name].strip
  @id = params[:id].to_i
  @list = session[:lists][@id]

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been renamed."
    redirect "/lists/#{@id}"
  end
end

# Delete single list, list.erb
post '/lists/:id/delete' do
  idx = params[:id].to_i
  list_name = session[:lists][idx][:name]
  session[:lists].delete_at(idx)
  session[:success] = "#{list_name} has been deleted."
  redirect '/lists'
end

# Create a new todo item
post '/lists/:id/todos' do
  todo_name = params[:todo]
  id = params[:id].to_i
  session[:lists][id][:todos] << todo_name
  session[:success] = "#{todo_name} has been added to the list."
  redirect "/lists/#{id}"
end