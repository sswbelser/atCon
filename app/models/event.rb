class Event < ActiveRecord::Base
	belongs_to :user, :category, :conference
	has_many :posts
end
