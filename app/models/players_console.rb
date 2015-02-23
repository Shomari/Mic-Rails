class PlayersConsole < ActiveRecord::Base
	belongs_to :player
	belongs_to :console

	has_many :sessions

	validates :gtag, :player_id, :console_id, presence: true
end
