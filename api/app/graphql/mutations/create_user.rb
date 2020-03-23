module Mutations
  class CreateUser < BaseMutation

    argument :name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name: nil, username: nil, email: nil, password: nil, password_confirmation: nil)
      return raise GraphQL::ExecutionError, {errors: "Passwords do not match"} if password != password_confirmation

      user = User.new(name: name, email: email, username: username, password: password)

      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end