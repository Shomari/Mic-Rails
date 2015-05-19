class Guess < ActiveRecord::Base
	belongs_to :player
	belongs_to :friend, class_name: "Player", foreign_key: "friend_id"
	belongs_to :question
	belongs_to :answer

	def self.already_guessed?(current_player, current_question, friend_id)
		Guess.where(question: current_question, player: current_player, friend: friend_id).present?		
	end

	def check_answer?(answer_bk)
		answer_id == answer_bk.answer_id		
	end
end
