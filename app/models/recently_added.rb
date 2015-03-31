class RecentlyAdded < ActiveRecord::Base
	belongs_to :player, :class_name => "Player"
	belongs_to :friend, :class_name => "Player", :foreign_key => "friend_id"

	def self.get_recents(current_player_id)
		RecentlyAdded.where("player_id = ? AND created_at > ?", current_player_id, 1.week.ago )
	end

	def self.already_added?(current_player_id, friend_id)
		ra = RecentlyAdded.where("player_id = ? AND friend_id =? AND created_at < ?", current_player_id, friend_id, 1.week.ago ).last
		if ra ? false : true
	end

	def self.is_not_recent?(current_player, friend_id)
		RecentlyAdded.where(player: current_player, friend_id: friend_id).empty?		 		
	end
end
