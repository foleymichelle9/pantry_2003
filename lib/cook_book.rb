class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
   ingredients = recipes.flat_map do |recipe|
     recipe.ingredients_required.keys
   end.uniq
   ingredient_names = ingredients.map do |ingredient|
     ingredient.name
   end
 end

 def highest_calorie_meal
   @recipes.max_by do |recipe|
     #require "pry"; binding.pry
     recipe.total_calories
   end
 end

 def date
   (Date.today).strftime("%m-%d-%Y")
 end
end
