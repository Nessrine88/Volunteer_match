class OpportunityPolicy < ApplicationPolicy
    def update?
      user.organization? && record.user == user
    end
  
    def destroy?
      user.organization? && record.user == user
    end
  end
  