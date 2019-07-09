# frozen_string_literal: true

require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'POST /login', type: :request do
    let(:key) { ENV['DEVISE_JWT_SECRET_KEY'] }
    let(:password) { '12345678' }
    let(:user) { FactoryBot.create(:user, password: password) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: password
        }
      }
    end

    before do
      post '/login', params: params
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token_from_request = response.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], true)

      expect(decoded_token.first['sub'].to_i).to eq user.id
    end
  end

  describe 'DELETE /logout', type: :request do
    before do
      delete '/logout'
    end

    it 'returns http no content' do
      expect(response).to have_http_status(:success)
    end
  end
end
