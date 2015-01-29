class Session < ActiveRecord::Base
	belongs_to :players_console
	belongs_to :consoles_game
end
