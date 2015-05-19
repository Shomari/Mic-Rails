class RecentlyAdded < ActiveRecord::Base
	belongs_to :player, :class_name => "Player"
	belongs_to :friend, :class_name => "PlayersConsole", :foreign_key => "friend_pc_id"
	belongs_to :game

	def self.get_recents(current_player_id)
		RecentlyAdded.where("player_id = ? AND created_at > ?", current_player_id, 1.week.ago )
	end

	def self.already_added?(current_player_id, friend_pc_id)
		recently_added = RecentlyAdded.where("player_id = ? AND friend_pc_id =? AND created_at > ?", current_player_id, friend_pc_id.to_i, 1.week.ago ).last
		recently_added ? true : false
	end

	def self.is_not_recent?(current_player, friend_id)
		RecentlyAdded.where(player: current_player, friend: friend_id).empty?		 		
	end
end
