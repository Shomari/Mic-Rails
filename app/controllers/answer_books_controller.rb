class AnswerBooksController < ApplicationController
	def create
		AnswerBook.create(answer_book_params, player: current_player)
		redirect_to sessions_path
	end

	private

	def answer_book_params
		params.require(:answer_book).permit(:question_id, :answer_id)		
	end
end