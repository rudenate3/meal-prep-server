class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :author
  has_many :recipe_ingredients
  has_many :ingredients
  has_many :tags
end
