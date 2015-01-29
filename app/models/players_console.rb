class PlayersConsole < ActiveRecord::Base
	belongs_to :player
	belongs_to :system

	has_many :sessions
end
