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
          post scopes: [:user, :read] do
            User.create(params)
          end

          desc 'list all users'
          get scopes: [:user, :read] do
            User.all
          end
        end
      end
    end
  end
end
