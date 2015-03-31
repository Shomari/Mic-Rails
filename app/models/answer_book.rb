class AnswerBook < ActiveRecord::Base
	belongs_to :player
	belongs_to :question
	belongs_to :answer

	def self.no_answer_submitted?(current_question, friend_id)
		AnswerBook.where(question: current_question, player_id: friend_id ).empty?	 		
	end
end
