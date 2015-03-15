class AnswerBooksController < ApplicationController
	def create
		ab=AnswerBook.new(answer_book_params)
		ab.player = current_player
		ab.save
		redirect_to sessions_path
	end

	private

	def answer_book_params
		params.require(:answer_book).permit(:question_id, :answer_id)		
	end
end