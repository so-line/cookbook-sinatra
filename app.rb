require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "cookbook"
require_relative "recipe"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get "/" do
  cookbook = Cookbook.new(File.join(__dir__,"recipes.csv"))
  @recipes = cookbook.all
  erb :index
end

get "/new" do
  r_name = params["name"]
  r_description = params["description"]
  r_rating = params["rating"]
  r_preptime = params["preptime"]
  erb :new
end

post "/new" do
  r_name = params[:name]
  r_description = params[:description]
  r_rating = params[:rating]
  r_preptime = params[:preptime]
  new_recipe = Recipe.new(r_name, r_description, r_rating, r_preptime)
  cookbook = Cookbook.new(File.join(__dir__,"recipes.csv"))
  cookbook.create(new_recipe)
  redirect to "/"
  end

# delete "/destroy" do
#   delete_recipe = Recipe.new(params[:name], params[:description], params[:rating], params[:preptime])
#   cookbook = Cookbook.new(File.join(__dir__,"recipes.csv"))
#   cookbook.destroy(delete_recipe)
# end
