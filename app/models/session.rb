class Session < ActiveRecord::Base
	belongs_to :players_console
	has_one :player, through: :players_console
	
	belongs_to :consoles_game

	def self.check_actives
		Session.where("(created_at > ?)", Time.now - 1.hour)
	end

	def self.active_session?(players_console_id)
		session = Session.where('(players_console_id = ? AND created_at > ?)', players_console_id, Time.now - 1.hour)
		return false if session.count > 0
		true
	end

	def self.get_active_sessions(console_game)
		Session.where('(consoles_game_id = ? AND created_at > ?)', console_game, Time.now - 1.hour)
	end

	def self.create_session(console_game, players_console_id)
		if Session.active_session?(players_console_id)
			Session.create(consoles_game: console_game, players_console: players_console_id)
		end
	end

	def self.get_active_session(console_game)
		Session.includes(:players_console, :player).where('(consoles_game_id = ? AND created_at > ?)',
		 console_game, Time.now - 1.hour).order('RAND()').first(6)
	end
end
