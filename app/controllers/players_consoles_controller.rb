class PlayersConsolesController < ApplicationController

	def new
		@players_console = PlayersConsole.new		
	end

	#worst method ever?
	def create		
		consoles = ["Xbox_One", "Playstation_4"]
		binding.pry
		#finish refactoring this method and view with simple form to get system params in one form
		PlayersConsole.create(xbox_params, player: current_player, console_id: XBOX)
		PlayersConsole.create(ps4_params, player: current_player, console_id: XBOX)
		
		# params.each do |key, value|
		# 	binding.pry
		# 	if consoles.include? key
		# 		if key == "Xbox_One"
		# 			PlayersConsole.create!(player: current_player, console_id: XBOX, gtag: params[:XBL] )
		# 		else
		# 			PlayersConsole.create!(player: current_player, console_id: PLAYSTATION, gtag: params[:PSN] )
		# 		end
		# 	end
		# end 
		redirect_to player_show_path(current_player)
	end

	def edit
	end

	def update		
		pc = PlayersConsole.where(player_id: current_player)
		consoles = ["Xbox_One", "Playstation_4"]		
		params.each do |key, value|
			if consoles.include? key
				if key == "Xbox_One"
					xb = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: XBOX )
					xb.gtag = params[:XBL]
					xb.player = current_player
					xb.save!
				else
					ps = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: PLAYSTATION )
					ps.gtag = params[:PSN]
					ps.player = current_player
					ps.save!
				end
			end
		end 
		redirect_to player_path(current_player)
	end

	private

	def xbox_params
		params.require(:XBL)#.permit(:XBL)
	end

	def ps4_params
		params.require(:players_console).permit(:PSN)
	end

	def players_console_params
		params.require(:players_console).permit(:systems_id)
	end
end