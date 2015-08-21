class RsvpsController < ApplicationController

  # add new rsvp to database
  def create
    # redirect user if already logged in
    puts "This is inside crate rsvp"
    if current_user
      @rsvp = Rsvp.new(rsvp_params)
      @rsvp.update_attributes(user_id: current_user.id)
      if @rsvp.save
        flash[:notice] = "Successfully saved rsvp."
        #redirect_to event_path(rsvp.event)
        render json:@rsvp
      else
        flash[:error] = @rsvp.errors.full_messages.join(', ')
        #redirect_to event_path
        render json:{errors: @rsvp.errors.full_messages.join(', ')}, status: :unprocessable_entity
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
