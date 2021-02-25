# frozen_string_literal: true

module Api
  module V1
    module Users
      class Base < Grape::API
        namespace :users do
          desc 'create user'
          params do
            requires :email, desc: 'user email'
          end
          post do
            User.create(params)
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
