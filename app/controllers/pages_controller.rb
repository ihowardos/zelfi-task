class PagesController < ApplicationController
  expose_decorated :events, -> { fetch_events }
  expose :event_registrations, -> { fetch_event_registrations }

  def home
  end

  private

  def fetch_events
    events = Event.all.includes(:tags)
                  .order(:created_at).page(params[:page]).per(3)
    events = events.where(tags: { name: params[:tag] }) if params[:tag]

    events
  end

  def fetch_event_registrations
    current_user.user_registrations.ids if current_user
  end
end
