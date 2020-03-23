module Mutations
  class LoginUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: false
    field :exp, String, null: true
    field :errors, [String], null: false

    def resolve(email: nil, password: nil)
      user = User.find_by_email(email)

      if user&.authenticate(password)
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i

        {
          user: user,
          token: token,
          exp: time.strftime("%m-%d-%Y %H:%M"),
          errors: []
        }
      else
        {
          user: nil,
          errors: user&.errors&.full_messages
        }
      end
    end
  end
end