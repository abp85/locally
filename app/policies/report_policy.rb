class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.pending
    end
  end
  def create?
    true
  end

  def show?
    true
  end

  def update?
    user == record.user
  end

  def resolve?
    update?
  end

  def reject?
    update?
  end

end
