class EventPolicy < ApplicationPolicy
  def manage?
    return false unless user
    !user.events.where(id: record.id).empty?
  end
end
