class RecentlyAddedsController < ApplicationController

	def index
		
		@recents = RecentlyAdded.where("player_id = ? AND created_at > ?",
				 current_player.id, 1.week.ago )
		@guess = Guess.new
	end

	def create
		player = current_player
		ra = RecentlyAdded.where("player_id = ? AND referrer_id =? AND created_at < ?",
				 player.id, params[:recently_added][:referrer], 1.week.ago ).last
		RecentlyAdded.create(player: player, referrer_id: params[:recently_added][:referrer]) if ra == nil
	end

	def show

	end

end