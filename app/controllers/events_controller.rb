class EventsController < ApplicationController

  def index
    @events = Event.all
    render :index
  end

	def new
    if current_user
		  @event = Event.new
		  render :new
    else
      flash[:error] = "Need to login to create event."
      redirect_to login_path
    end
	end
	

	# add new event to database
	def create
		# redirect user if already logged in
		if current_user
			event = Event.new(event_params)
      event.conference_id = 1

			if event.save
				flash[:notice] = "Successfully saved event."
				redirect_to event_path(event)
			else
				flash[:error] = event.errors.full_messages.join(', ')
				redirect_to event_path
			end
		else
      flash[:error] = "Need to login to create event."
			redirect_to login_path
		end
	end

  def edit
    if current_user 
      @event = Event.find(params[:id])
      render :edit
    else
      flash[:error] = flash[:error] = "Need to login to create event."
      redirect_to login_path
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
        flash[:error] = event.errors.full_messages.join(', ')
        redirect_to edit_event_path  
       end
    else
      flash[:error] = flash[:error] = "Need to login to create event."
      redirect_to edit_event_path
    end

  end

	def show
    if Event.find_by_id(params[:id])
		  @event = Event.find(params[:id])
		  render :show
    else
      flash[:error] = "Could not find event #{params[:id]}"
    redirect_to root_path
   end
	end

  def destroy
    if event = Event.find(params[:id])
      if current_user
        flash[:notice] = "Successfully deleted Event!"
        event.delete
        redirect_to events_path
      else
        flash[:error] = "You need to login in to delete event."
        redirect_to login_path
     end
   else
      flash[:error] = event.errors.full_messages.join(', ')
      redirect_to events_path
   end
  end

	private
		def event_params
			params.require(:event).permit(:name, :address, :city, :state, :start_date, :end_date, :start_time, :end_time, :capacity, :cost, :category_id)
		end

end