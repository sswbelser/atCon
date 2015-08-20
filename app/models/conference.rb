class Conference < ActiveRecord::Base
	has_many :users
  	has_many :events
end
