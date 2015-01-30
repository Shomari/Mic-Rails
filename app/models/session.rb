class Session < ActiveRecord::Base
	belongs_to :players_console
	belongs_to :game

	def check_actives
		inactives = Session.where("(created_at < ?)", Time.now - 1.hour)
		#use scoped for inactives
	end
end
