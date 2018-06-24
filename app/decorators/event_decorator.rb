class EventDecorator < ApplicationDecorator
  delegate :id, :title, :description, :photo
end
