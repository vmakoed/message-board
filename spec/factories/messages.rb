# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    content { 'text' }

    association :user
  end
end
