class Recipe < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :users, through: :comments
end
