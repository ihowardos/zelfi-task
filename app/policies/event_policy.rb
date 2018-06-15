class EventPolicy < ApplicationPolicy
  def manage?
    !user.events.where(id: record.id).empty?
  end
end
