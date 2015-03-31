class PlayersConsole < ActiveRecord::Base
	belongs_to :player
	belongs_to :console

	has_many :sessions

	validates :gtag, :player_id, :console_id, presence: true
	# validates :gtag, :length, :minimum(2)

	def self.hashify_gtags
		consoles = {}
		PlayersConsole.where(player: current_player).each do |system|
			system.console_id == 1 ? consoles[:xbl] = system.gtag : consoles[:psn] = system.gtag
		end	
		consoles
	end
end
