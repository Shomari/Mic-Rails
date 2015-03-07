class QuestionsController < ApplicationController

	def show
		@question = Question.find(params[:id])
		@answers = Answer.where(question: @question)
		@answer_bk = AnswerBook.new
	end

end