# frozen_string_literal: true

require 'spec_helper'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    # password { 'Password1' }
    # password_confrimation { 'Password1' }
  end
end
