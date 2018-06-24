class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!

  expose :event_registration

  def create
    if current_user && !event_registered?
      event_registration.user = current_user

      event_registration.save
    else
      flash[:notice] = "You have already registered for this event."
    end

    respond_with event_registration, location: root_path
  end

  private

  def event_registration_params
    params.require(:event_registration).permit(:event_id)
  end

  def event_registered?
    current_user
      .user_registrations.ids.include?(event_registration_params[:event_id].to_i)
  end
end
