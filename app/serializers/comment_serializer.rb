class CommentSerializer < ActiveModel::Serializer
  attributes  :user, :content
  has_one :user
  has_one :recipe
end
