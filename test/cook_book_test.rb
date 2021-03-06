require "minitest/autorun"
require "minitest/pride"
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class CookbookTest < Minitest::Test

  def setup
    @cookbook = CookBook.new
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_has_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_a_recipe
  @cookbook.add_recipe(@recipe1)
  assert_equal [@recipe1], @cookbook.recipes
  @cookbook.add_recipe(@recipe2)
  assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_it_can_add_ingredients
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 4)
    @recipe1.add_ingredient(@ingredient3, 8)
    @recipe1.add_ingredient(@ingredient4, 8)

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_it_can_determine_highest_calorie_meal
    skip
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 4)
    @recipe1.add_ingredient(@ingredient3, 8)
    @recipe1.add_ingredient(@ingredient4, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_it_can_find_date
    assert_equal "04-22-2020", @cookbook.date
  end

  def test_it_can_find_summary
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    expected = [{:ingredient=>"Macaroni", :amount=>"8 oz"},
                {:ingredient=>"Cheese", :amount=>"2 C"}]
    assert_equal expected, cookbook.ingredient_details(recipe1)
  end
end
