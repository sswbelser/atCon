class EventsController < ApplicationController
	def new
		@event = Event.new
		render :new
	end
	

  def create
    
  end

	def show
		@event = Event.find(params[:name])
		render :show
	end
end
