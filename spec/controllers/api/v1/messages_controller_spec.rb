# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

describe Api::V1::MessagesController, type: :controller do
  include Devise::Test::IntegrationHelpers

  let!(:headers) do
    user = FactoryBot.create(:user)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end

  let!(:user) { FactoryBot.create(:user) }

  before do
    request.headers.merge!(headers)
  end

  describe 'GET #index' do
    let!(:messages) { FactoryBot.create_list(:message, 2) }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected existing messages' do
      expect(response.body).to match(messages.to_json)
    end
  end

  describe 'GET #show' do
    let!(:message) { FactoryBot.create(:message) }

    before do
      get :show, params: { id: message_id }
    end

    let(:message_id) { message.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected message attributes' do
      expect(response.body).to eq(message.to_json)
    end
  end

  describe 'POST #create' do
    before do
      post :create, params: { message: message_params }
    end

    let(:message_params) { { content: 'hello world' } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains created message attributes' do
      expect(JSON.parse(response.body)['content']).to eq(message_params[:content])
    end
  end

  describe 'PUT #update' do
    let(:message) { FactoryBot.create(:message, content: 'foo') }
    let(:new_content) { 'bar' }

    before do
      put :update, params: { id: message.id, message: { content: new_content } }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'updates the record' do
      expect(Message.find(message.id).content).to eq(new_content)
    end

    it 'JSON body response contains created message attributes' do
      expect(JSON.parse(response.body)['content']).to eq(new_content)
    end
  end

  describe 'DELETE #destroy' do
    let(:message) { FactoryBot.create(:message, content: 'foo') }

    before do
      delete :destroy, params: { id: message.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'deletes the record' do
      expect(Message.find_by(id: message.id)).to be_nil
    end
  end
end
