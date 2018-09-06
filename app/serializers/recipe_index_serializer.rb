class RecipeIndexSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :author, :favorited
end
