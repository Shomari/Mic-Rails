class PlayersConsole < ActiveRecord::Base
	belongs_to :player
	belongs_to :console

	has_many :sessions
end
