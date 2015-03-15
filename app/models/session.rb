class Session < ActiveRecord::Base
	belongs_to :players_console
	has_one :player, through: :players_console
	
	belongs_to :consoles_game

	def check_actives
		Session.where("(created_at > ?)", Time.now - 1.hour)
	end
end
