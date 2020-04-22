class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
    @ingredients << ingredient
  end

  def ingredient_calories(ingredient)
      ingredient.calories * @ingredients_required[ingredient]
    end

    def total_calories
      @ingredients.sum {|ingredient| ingredient_calories(ingredient) }
    end
end
