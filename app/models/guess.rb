class Guess < ActiveRecord::Base
	belongs_to :player
	belongs_to :friend, class_name: "Player", foreign_key: "friend_id"
	belongs_to :question
	belongs_to :answer
end
