class MembershipTypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    false || user.admin?
  end

  def create?
    false || user.admin?
  end

  def new?
    create?
  end

  def update?
    false || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
