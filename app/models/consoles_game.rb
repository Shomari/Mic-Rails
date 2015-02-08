class ConsolesGame < ActiveRecord::Base
	belongs_to :console
	belongs_to :game

	has_many :sessions
end
