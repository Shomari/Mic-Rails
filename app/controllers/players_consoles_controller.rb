class PlayersConsolesController < ApplicationController

	def new
		@players_console = PlayersConsole.new		
	end

	#worst method ever?
	def create		
		player = session[:player]
		consoles = ["Xbox_One", "Playstation_4"]
		
		
		params.each do |key, value|
			if consoles.include? key
				if key == "Xbox_One"
					PlayersConsole.create!(player_id: player, console_id: XBOX, gtag: params[:XBL] )
				else
					PlayersConsole.create!(player_id: player, console_id: PLAYSTATION, gtag: params[:PSN] )
				end
			end
		end 
		redirect_to player_path(player)
	end

	def edit
	end

	def update
		player = session[:player]
		pc = PlayersConsole.where(player_id: player)
		consoles = ["Xbox_One", "Playstation_4"]		
		
		params.each do |key, value|
			if consoles.include? key
				if key == "Xbox_One"
					xb = PlayersConsole.find_or_initialize_by(player_id: player, console_id: XBOX )
					xb.gtag = params[:XBL]
					xb.save!
				else
					ps = PlayersConsole.find_or_initialize_by(player_id: player, console_id: PLAYSTATION )
					ps.gtag = params[:PSN]
					ps.save!
				end
			end
		end 


		redirect_to player_path(player)
	end

	private

	def players_console_params
		params.require(:players_console).permit(:systems_id)
	end
end