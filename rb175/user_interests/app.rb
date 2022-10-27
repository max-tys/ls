require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @user_database = YAML.load_file("users.yaml") # yaml to Ruby hash
  @all_names = @user_database.keys.map(&:to_s) # array of users' names
  @user_count = @user_database.size # number of users in database
  @interest_count = count_interests # total count of interests
end

get "/" do
  @title = "Users and Interests"

  erb :home
end

get "/users/:user" do
  @name = params[:user]

  redirect "/" unless @all_names.include? @name

  @title = @name.capitalize

  details = @user_database[@name.to_sym]
  @email = details[:email]
  @interests = details[:interests].join(", ")
  @other_names = names_of_other_users(@name)

  erb :user
end

helpers do
  def count_interests
    @user_database.inject(0) do |count, (name, details)|
      count + details[:interests].count
    end
  end

  def names_of_other_users(current_user)
    others = @all_names.dup
    others.delete(current_user)
    others
  end
end