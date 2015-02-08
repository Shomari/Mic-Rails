class SessionsController < ApplicationController

	def index
		
	end

	def create
		player = Player.find(session[:player])
		console = Console.where(name: params[:console])
		pc = PlayersConsole.where(player: player, console: console).first		
		if params[:psgames] == ""
			holder = params[:xbgames]
		else
			holder = params[:psgames]
		end
		game = ConsolesGame.find(holder)
		Session.create(consoles_game: game, players_console: pc)

		@sessions = Session.where('(consoles_game_id = ? AND created_at > ?)', game, Time.now - 1.hour)
		

		render :index
	end

	private

	def session_parms
		params.require(:session).permit(:console, :consoles_game)
	end

end