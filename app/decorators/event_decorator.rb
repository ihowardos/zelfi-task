class EventDecorator < ApplicationDecorator
  delegate :title, :description
end
