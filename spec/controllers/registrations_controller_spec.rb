# frozen_string_literal: true

require 'rails_helper'

describe RegistrationsController, type: :controller do
  let(:params) do
    {
      email: 'user@example.com',
      password: '12345678'
    }
  end

  describe 'POST /signup', type: :request do
    before do
      post '/signup', params: { user: params }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assig a new user' do
      expect(JSON.parse(response.body)['id']).not_to be_nil
    end

    it 'returns a new user with requested e-mail' do
      expect(JSON.parse(response.body)['email']).to eq params[:email]
    end
  end
end
