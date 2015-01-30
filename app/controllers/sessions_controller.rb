class SessionsController < ApplicationController

	def index
		Session.where
	end

	def create
		player = session[:player]
		console = params[:console]
		pc = PlayersConsole.where(player_id: player, console_id: console)
		game = Game.find(params[:game])
		Session.create(game_id: game, players_console_id: pc)

		sessions = Session.where(game_id: game, status: "active")
	end

	private

	def session_parms
		params.require(:session).permit(:console, :game)
	end

end