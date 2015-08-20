class RsvpsController < ApplicationController

  # add new event to database
  def create
    # redirect user if already logged in
    if current_user
      rsvp = Rsvp.new(rsvp_params)
      if rsvp.save
        flash[:notice] = "Successfully saved rsvp."
        redirect_to event_path(rsvp.event)
      else
        flash[:error] = rsvp.errors.full_messages.join(', ')
        redirect_to event_path
      end
    else
      flash[:error] = "Need to login to create event."
      redirect_to login_path
    end
  end

  private
    def rsvp_params
      params.require(:rsvp).permit(:user_id, :event_id)
    end
end
