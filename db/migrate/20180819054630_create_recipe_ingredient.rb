class CreateRecipeIngredient < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :quantity
    end
  end
end
