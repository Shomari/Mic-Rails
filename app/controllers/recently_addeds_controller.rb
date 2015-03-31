class RecentlyAddedsController < ApplicationController

	def index		
		@recents = RecentlyAdded.get_recents(current_player.id)
	end

	def create		
		if RecentlyAdded.already_added?(current_player.id, params[:recently_added][:referrer] )
			RecentlyAdded.create(player: player, referrer_id: params[:recently_added][:referrer])
		end
	end

	def show

	end

end