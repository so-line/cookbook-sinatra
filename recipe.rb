class Recipe
  attr_reader :name, :description, :rating, :done, :preptime

  def initialize(name, description, rating = nil, preptime = nil)
    @name = name
    @description = description
    @rating = rating
    @done = false
    @preptime = preptime
  end

  def mark_as_done!
    @done = true
  end
end
