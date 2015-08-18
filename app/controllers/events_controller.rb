class EventsController < ApplicationController
	def new
		@event = Event.new
		render :new
	end
	

  def create
    
  end
end
