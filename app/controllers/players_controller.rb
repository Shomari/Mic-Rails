class PlayersController < ApplicationController

	def index
	end

	def new
		@player = Player.new
	end

	def create		
		player = Player.create(player_params)
		session[:player] = player
		redirect_to new_players_console_path
	end

	def show
		@player = session[:player]
		@PS4 = Game.where(console: "PS4")
		@XB1 = Game.where(console: "XB1")
		@game = Game.all
	end


	#select system, select game and time.
	#this creates a session with these datas
	#then get all active sessions
	#show the gamertags for people that have active sessions for the same consle system


	private

	def player_params
		params.require(:player).permit(:email, :password)
	end

end