class Ingredient < ApplicationRecord
  has_one :quantity_type, class_name: 'Quantity', foreign_key: :quantity_id
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients, dependent: :destroy
end
