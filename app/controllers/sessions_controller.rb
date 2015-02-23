class SessionsController < ApplicationController

	def index
		
	end

	def create
		player = Player.find(session[:player])
		console = Console.where(name: params[:console])
		pc = PlayersConsole.where(player: player, console: console).first
		
		redirect_to player_path(player), notice: "You don't have a tag associated with this console." and return if pc == nil
	
		
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