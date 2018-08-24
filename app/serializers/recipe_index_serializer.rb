class RecipeIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :favorited
end
