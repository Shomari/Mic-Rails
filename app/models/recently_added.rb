class RecentlyAdded < ActiveRecord::Base
	belongs_to :player, :class_name => "Player"
	belongs_to :friend, :class_name => "Player", :foreign_key => "friend_id"
end
