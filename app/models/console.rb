class Console < ActiveRecord::Base
	has_many :players_consoles
	has_many :players, through: :players_consoles

	has_many :consoles_games
	has_many :games, through: :consoles_games
end
