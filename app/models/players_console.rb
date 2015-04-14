class PlayersConsole < ActiveRecord::Base
	belongs_to :player
	belongs_to :console

	has_many :sessions

	validates :player_id, :console_id, presence: true
	validates :gtag, length: { in: 3..19 }

	def self.hashify_gtags(current_player)
		consoles = {}
		PlayersConsole.where(player: current_player).each do |system|
			system.console_id == 1 ? consoles[:xbl] = system.gtag : consoles[:psn] = system.gtag
		end	
		consoles
	end
end
