class PlayersController < ApplicationController
	include PlayersHelper
	before_action :authenticate_player!, except: [:index]

	def index
		@player = Player.new
		#@xbsessions = Session.where('(consoles_game_id = ? AND created_at > ?)', game, Time.now - 1.hour)
		@sessions = Session.where('(created_at > ?)', Time.now - 1.hour).group("consoles_game_id").to_a		
	end

	def new
		@player = Player.new
	end

	def login
		
	end

	def verify		
		player = Player.where(email: params[:player][:email], password: params[:player][:password]).first
		session[:player] = player.id
		redirect_to player_path(player)		
	end

	# def create		
	# 	player = Player.new(player_params)
	# 	binding.pry
	# 	if player.save
	# 		session[:player] = player.id
	# 		redirect_to new_players_console_path
	# 	else
	# 		#player.save
	# 		flash[:notice] = player.errors
	# 		redirect_to(:back)
	# 	end
	# end

	def show
		@player = current_player
		@gtags = hashify_gtags
		@PS4 = ps_games
		@XB1 = xbox_games		
	end

	private

	def player_params
		params.require(:player).permit(:email, :password, :tagline)
	end

	def hashify_gtags
		systems = PlayersConsole.where(player: current_player).to_a
		consoles = {}
		systems.each do |system|
			system.console_id == 1 ? consoles[:xbl] = system.gtag : consoles[:psn] = system.gtag
		end	
		consoles
	end

end