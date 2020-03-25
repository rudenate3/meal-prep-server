module Types
  class QueryType < Types::BaseObject

    field :users, [Types::UserType], null: false

    def users
      if context[:current_user]
        User.all
      else
        raise GraphQL::ExecutionError, "Not authorized"
      end
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end