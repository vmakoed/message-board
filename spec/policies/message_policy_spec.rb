# frozen_string_literal: true

require 'rails_helper'

describe MessagePolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:message) { FactoryBot.create(:message, user: message_owner) }

  permissions :update?, :edit?, :destroy? do
    context 'when message is owned by another user' do
      let(:message_owner) { FactoryBot.create(:user) }

      it 'denies access' do
        expect(subject).not_to permit(user, message)
      end
    end

    context 'when message is owned by the same user' do
      let(:message_owner) { user }

      it 'denies access' do
        expect(subject).to permit(user, message)
      end
    end
  end
end
