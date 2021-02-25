# frozen_string_literal: true

require 'doorkeeper/grape/helpers'

module Api
  module V1
    class Base < Grape::API
      include Api::V1::Defaults

      mount Api::V1::Users::Base

      helpers Doorkeeper::Grape::Helpers

      before do
        doorkeeper_authorize!
      end

      # For old versions of Grape:
      #   route_setting :scopes, ['user:email']
      #
      get :me, scopes: [:user, :read] do
        current_user.to_json
      end
    end
  end
end
