class PagesController < ApplicationController
  expose_decorated :events, -> { fetch_events }
  expose :event_registrations, -> { fetch_event_registrations }

  def home
  end

  private

  def fetch_events
    Event.all.order(:created_at).page(params[:page]).per(3)
  end

  def fetch_event_registrations
    current_user.user_registrations.ids
  end
end
