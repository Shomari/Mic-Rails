class ConsolesGame < ActiveRecord::Base
	belongs_to :game
	belongs_to :system

	has_many :sessions
end
