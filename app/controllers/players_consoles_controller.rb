class PlayersConsolesController < ApplicationController

	def new
		@players_consoles = PlayersConsole.new		
	end


	### check to see if there is a open group
	### if so, join open group
	### if not, create group with that person in it

	### group checks every .5 seconds for number
	### once group has 4, renders view with the 4 people in it

	### while waiting, there is an open websocket
	### if websocket closes while group is open, then that person is removed from group

	def create		
		#finish refactoring this method and view with simple form to get system params in one form
		xbox = PlayersConsole.new(gtag: params[:XBL])
		xbox.player = current_player
		xbox.console_id = XBOX
		xbox.save

		playstation = PlayersConsole.new(gtag: params[:PSN])
		playstation.player = current_player
		playstation.console_id = PLAYSTATION
		playstation.save

		redirect_to player_show_path(current_player)
	end

	def edit
	end

	def update		
		if params[:XBL] != ""
			xbox = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: XBOX )
			xbox.gtag = params[:XBL]
			xbox.save!
		end

		if params[:PSN] != ""
			playstation = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: PLAYSTATION )
			playstation.gtag = params[:PSN]
			playstation.save!
		end


		# consoles = ["Xbox_One", "Playstation_4"]		
		# params.each do |key, value|
		# 	if consoles.include? key
		# 		if key == "Xbox_One"
		# 			xb = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: XBOX )
		# 			xb.gtag = params[:XBL]
		# 			xb.player = current_player
		# 			xb.save!
		# 		else
		# 			ps = PlayersConsole.find_or_initialize_by(player_id: current_player, console_id: PLAYSTATION )
		# 			ps.gtag = params[:PSN]
		# 			ps.player = current_player
		# 			ps.save!
		# 		end
		# 	end
		# end 
		redirect_to player_path(current_player)
	end

	private

	def xbox_params
		params.require(:gtag).permit(:XBL)
	end

	def ps4_params
		params.require(:gtag).permit(:PSN)
	end

	def players_console_params
		params.require(:players_console).permit(:systems_id)
	end
end