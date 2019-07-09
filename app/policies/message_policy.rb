# frozen_string_literal: true

class MessagePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    owned_by_user?
  end

  def edit?
    update?
  end

  def destroy?
    owned_by_user?
  end
end
