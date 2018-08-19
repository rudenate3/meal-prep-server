class Recipe < ApplicationRecord
  DeviseTokenAuth::Concerns::User
  belongs_to :author, class_name: 'User', foreign_key: :user_id
end
