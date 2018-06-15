class EventDecorator < ApplicationDecorator
  delegate :title, :description, :photo
end
