# frozen_string_literal: true

module Api
  module V1
    module Users
      class Base < Grape::API
        namespace :users do
          desc 'create user'
          params do
            requires :email, desc: 'user email'
            requires :password, desc: 'user password'
            requires :confirmation_password, desc: 'user confirmation password'
          end
          post do
            User.create(params)
          end

          desc 'create user'
          params do
            requires :email, desc: 'user email'
            requires :password, desc: 'user password'
          end
          post :login do
            user = User.find_for_database_authentication(email: sign_in_params[:email])
            if user.valid_password?(sign_in_params[:password])
              render json: { token: "token" }
            else
              render json: {
                messages: "Signed In Failed - Unauthorized",
                  is_success: false,
                  data: {}
              }, status: :unauthorized
            end
          end


          desc 'list all users'
          get do
            User.all
          end
        end
      end
    end
  end
end
