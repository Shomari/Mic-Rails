class PlayersConsolesController < ApplicationController

	def new
		@players_console = PlayersConsole.new		
	end

	#worst method ever?
	def create		
		player = session[:player]
		consoles = Console.all
		#["Xbox_one", "Playstation_4"]
		
		params.each do |param|
			if consoles.include? param
				if param == "Xbox_One"
					PlayersConsole.create(player_id: player, system_id: param, gtag: params[:XBL] )
				else
					PlayersConsole.create(player_id: player, system_id: param, gtag: params[:PSN] )
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