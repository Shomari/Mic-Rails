class Game < ActiveRecord::Base
	has_many :consoles_games
	has_many :consoles, through: :consoles_games
end
