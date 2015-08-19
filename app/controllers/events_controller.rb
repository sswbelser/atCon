class EventsController < ApplicationController

  def index
    @events = Event.all
    render :index
  end

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

  def edit
    if current_user 
      @event = Event.find(params[:id])
      render :edit
    else
      flash[:error] = event.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  def update
    event = Event.find(params[:id])
    if current_user
        puts "this is event params==#{event_params}"
       if event.update_attributes(event_params)
         redirect_to event_path(event)
         flash[:notice] = "Successfully updated event:#{event.name}!"
       else
        flash[:error] = user.errors.full_messages.join(', ')
        redirect_to edit_event_path  
       end
    else
      flash[:error] = user.errors.full_messages.join(', ')
      redirect_to edit_event_path
    end

  end

	def show
		@event = Event.find(params[:id])
		render :show
	end

	private
		def event_params
			params.require(:event).permit(:name, :address, :city, :state, :start_date, :end_date, :start_time, :end_time, :capacity, :cost, :category_id)
		end

end

      # some_params = {name: event_params[:name], address: event_params[:address],city: event_params[:city],
      # state: event_params[:state], start_date: event_params[:start_date], end_date: event_params[:end_date],
      # start_time: event_params[:start_time], end_time: event_params[:end_time],
      # capacity: event_params[:capacity], cost: event_params[:cost], category: event_params[:category].to_i}


