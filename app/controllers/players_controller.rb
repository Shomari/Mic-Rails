class PlayersController < ApplicationController
	include PlayersHelper

	def index
		@player = Player.new
	end

	def new
		@player = Player.new
	end

	def login
		
	end

	def verify		
		player = Player.where(email: params[:player][:email], password: params[:player][:password]).first
		# binding.pry
		session[:player] = player.id
		redirect_to player_path(player)		
	end

	def create		
		player = Player.create(player_params)
		session[:player] = player.id
		redirect_to new_players_console_path
	end

	def show
		@player = Player.find(session[:player])
		@PS4 = ps_games
		@XB1 = xbox_games
	end

	private

	def player_params
		params.require(:player).permit(:email, :password)
	end

end