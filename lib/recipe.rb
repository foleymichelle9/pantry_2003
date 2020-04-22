class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    @ingredients << ingredient
  end

  def ingredients
    #@ingredients_required[ingredients]
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end

  def summary
    cookbook_summary = Hash.new { |hash, key| hash[ingredient] = {:name => "", :details => {}} }
      @recipes.each do |recipe|
        #not finished 
    end
  end
end
