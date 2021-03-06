Rails.application.routes.draw do
  devise_for :users, skip: [:password, :confirmation, :unlock]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  use_doorkeeper
  mount Api::V1::Base => '/'
end
