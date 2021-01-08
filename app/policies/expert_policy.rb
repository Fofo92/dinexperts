class ExpertPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
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
    false || user.admin?
  end
end
