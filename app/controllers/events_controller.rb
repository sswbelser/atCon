class EventsController < ApplicationController
	def new
		@event = Event.new
		render :new
	end
	

	# add new event to database
	def create
		# redirect user if already logged in
		if current_user
			event = Event.new(event_params)
			if event.save
				flash[:notice] = "Successfully saved event."
				redirect_to event_path(event)
			else
				flash[:error] = event.errors.full_messages.join(', ')
				redirect_to event_path
			end
		else
			redirect_to root_path
		end
	end

	def show
		@event = Event.find(event_params[:name])
		render :show
	end

	private
		def event_params
			params.require(:event).permit(:name, :address, :city, :state, :date_start, :date_end, :start_time, :end_time, :capacity, :cost, :catorgory)
		end

end