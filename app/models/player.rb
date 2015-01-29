class Player < ActiveRecord::Base
	has_many :players_consoles
	has_many :consoles, through: :players_consoles
end
