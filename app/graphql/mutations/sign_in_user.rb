class Mutations::SignInUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: false
  field :token, String, null: false
  field :errors, [String], null: false

  def resolve(email:, password:)
    user = User.find_by(email: email)
    
    return unless user
    return unless user.authenticate(password)

    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")
    
    context[:session][:token] = token

    OpenStruct.new({
      user: user,
      token: token
    })

    {
      user: user,
      token: token,
      errors: [],
    }
    # if inventory.update(quantity: quantity)
    #   # Successful creation, return the created object with no errors
    #   {
    #     inventory: inventory,
    #     errors: [],
    #   }
    # else
    #   # Failed save, return the errors to the client
    #   {
    #     inventory: nil,
    #     errors: inventory.errors.full_messages
    #   }
    # end
  end


end