class AnswerBooksController < ApplicationController
	def create
		answer_book = AnswerBook.new(answer_book_params)
		answer_book.update_attributes(player: current_player)
		redirect_to sessions_path
	end

	private

	def answer_book_params
		params.require(:answer_book).permit(:question_id, :answer_id)		
	end
end