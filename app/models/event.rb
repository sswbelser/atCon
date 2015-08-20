class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :category 
	belongs_to :conference
	has_many :posts,  dependent: :destroy
end
