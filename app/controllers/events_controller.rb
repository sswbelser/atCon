class EventsController < ApplicationController
	def new
		@event = Event.new
		render :new
	end
	

	# add new event to database
	def create
		# redirect user if already logged in
		if current_user
			redirect_to root_path
		else
			event = Event.new(event_params)
			if event.save
				flash[:notice] = "Successfully saved event."
				redirect_to event_path(event)
			else
				flash[:error] = event.errors.full_messages.join(', ')
				redirect_to event_path
			end
		end
	end

	def show
		@event = Event.find(params[:name])
		render :show
	end

	private
		def event_params
			params.require(:user).permit(:name, :address, :city, :state, :date_start, :date_end, :start_time, :end_time, :capacity, :cost, :catorgory_id)
		end

end