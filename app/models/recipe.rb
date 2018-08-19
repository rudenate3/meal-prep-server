class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end