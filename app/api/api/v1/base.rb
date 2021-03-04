# frozen_string_literal: true

require 'doorkeeper/grape/helpers'

module Api
  module V1
    class Base < Grape::API
      include Api::V1::Defaults

      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      mount Api::V1::Users::Base

      # For old versions of Grape:
      #   route_setting :scopes, ['user:email']
      #
      get :me, scopes: [:user, :read] do
        current_user.to_json
      end

      helpers do
        def current_user
          return @current_user if defined?(@current_user)

          if doorkeeper_token&.resource_owner_id&.present?
            @current_user = User.find(doorkeeper_token.resource_owner_id)
          end
        end
      end
    end
  end
end