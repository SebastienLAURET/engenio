# frozen_string_literal: true

Doorkeeper.configure do
  orm :active_record

  reuse_access_token

  api_only
  base_controller 'ApplicationController'

  skip_authorization do
    true
  end

  grant_flows %w[password]

  resource_owner_from_credentials do |routes|
    user = User.find_by_email(params[:username].downcase)

    user if user&.valid_password?(params[:password])
  end
end
