class GuessesController < ApplicationController

	def index
		binding.pry
		@question = Question.last
		@answers = Answer.where(question: @question)
		@player = Player.find(params[:player])
		render "questions/guess"
	end

	def create
		bin
	end
end