class RecentlyAdded < ActiveRecord::Base
	belongs_to :player
	belongs_to :referrer, :class_name => "Player", :foreign_key => "player_id"
end
