# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Users::Base, type: :api do
  describe 'POST /api/v1/users' do
    subject { call_api(params) }

    let(:valid_params) { attributes_for :user }

    context 'with valid params' do
      let(:params) { valid_params }

      it 'response with success' do
        expect(subject.status).to eq(201)
      end

      it 'return all users' do
        expect(JSON.parse(subject.body)).to include(
          'id' => String,
          'email' => valid_params[:email]
        )
      end
    end
  end

  describe 'GET /api/v1/users' do
    subject { call_api }

    let!(:users) do
      create_list :user, 10
    end

    it 'response with success' do
      expect(subject.status).to eq(200)
    end

    it 'return all users' do
      expect(JSON.parse(subject.body).count).to eq(users.count)
    end
  end
end
