class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :category 
	belongs_to :conference
	has_many :posts, dependent: :destroy
	has_many :rsvps
	has_many :users, through: :rsvps
end
