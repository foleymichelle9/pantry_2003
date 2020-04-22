class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    total = @stock.sum do |key, value|
      value if key == ingredient
    end
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  # def restock(ingredient, amount)
  #   if @stock[ingredient] == nil
  #     @stock[ingredient] = amount
  #   else
  #     @stock[ingredient] += amount
  #   end
  # end


  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amount|
        stock.keys.include?(ingredient) && stock[ingredient] >= amount
    end
  end
end
