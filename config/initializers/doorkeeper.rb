# frozen_string_literal: true

Doorkeeper.configure do
  orm :active_record

  api_only
  base_controller 'ActionController::API'

  resource_owner_authenticator do
    current_user || warden.authenticate!(scope: :user)
  end

  admin_authenticator do
    current_user || warden.authenticate!(scope: :user)
  end

  grant_flows %w[password]

  resource_owner_from_credentials do |routes|
    user = User.find_for_database_authentication(email: params[:username])
    if user&.valid_for_authentication? { user.valid_password?(params[:password]) } && user&.active_for_authentication?
      request.env['warden'].set_user(user, scope: :user, store: false)
      user
    end
  end

end
