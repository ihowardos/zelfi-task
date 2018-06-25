class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

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
    event_params[:tag_list]
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
      :photo,
      :tag_list
    )
  end

  def fetch_events
    Event.includes(:tags).where(user: current_user).page(params[:page]).per(3)
  end
end
