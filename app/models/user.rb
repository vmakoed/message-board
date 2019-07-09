# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages

  devise :database_authenticatable, :registerable, :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist
end
