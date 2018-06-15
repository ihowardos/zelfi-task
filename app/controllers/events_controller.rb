class EventsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :event
  expose_decorated :events, -> { fetch_events }

  def index
  end

  def new
  end

  def show
  end

  def edit
    authorize event, :manage?
  end

  def create
    event.user = current_user

    event.save

    respond_with event
  end

  def update
    event.update_attributes(event_params)

    respond_with event
  end

  def destroy
    authorize event, :manage?
    
    event.destroy

    respond_with event, location: events_path
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :photo
    )
  end

  def fetch_events
    Event.where(user: current_user)
  end
end
