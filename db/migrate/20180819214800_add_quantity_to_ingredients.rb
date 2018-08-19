class AddQuantityToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :quantity, foreign_key: true
  end
end
