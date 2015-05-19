class RecentlyAddedsController < ApplicationController

	def index		
		@recents = RecentlyAdded.get_recents(current_player.id)
	end

	def create		
		game = ConsolesGame.find(params[:recently_added][:game]).game
		if !RecentlyAdded.already_added?(current_player.id, params[:recently_added][:referrer] )
			RecentlyAdded.create(player: current_player, game: game, friend_pc_id: params[:recently_added][:referrer])
		end
		redirect_to player_path(current_player)
	end

	def show

	end

end