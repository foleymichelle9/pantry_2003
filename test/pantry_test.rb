require "minitest/autorun"
require "minitest/pride"
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock_is_empty
    assert_equal ({}), @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
    assert_equal 0, @pantry.stock_check(@ingredient2)
  end

  def test_it_can_restock
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    #@pantry.restock(@ingredient2, 7)
    assert_equal 15, @pantry.stock_check(@ingredient1)
    #assert_equal 7, @pantry.stock_check(@ingredient2)
  end

  def test_it_can_determine_enough_ingredients
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)
  end
end
