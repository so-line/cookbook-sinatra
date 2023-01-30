require "csv"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |element|
      new_recipe = Recipe.new(element[0], element[1], element[2], element[3])
      @recipes << new_recipe
    end
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.preptime]
      end
    end
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.preptime]
      end
    end
  end
end
