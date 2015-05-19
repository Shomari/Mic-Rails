class AnswerBook < ActiveRecord::Base
	belongs_to :player
	belongs_to :question
	belongs_to :answer

	def self.no_answer_submitted?(current_question, friend_id)
		pc = PlayersConsole.find(friend_id)
		friend = pc.player
		AnswerBook.where(question: current_question, player: friend ).empty?	 		
	end
end
