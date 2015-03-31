class GuessesController < ApplicationController

	def index
		if RecentlyAdded.is_not_recent?(current_player, params[:friend])
		 redirect_to :back, flash: {error: "You haven't recently played with this player"} and return
		elsif AnswerBook.no_answer_submitted?(current_question, params[:friend])
		 redirect_to :back, flash: {error: "This person hasn't answered this question yet"} and return
		elsif Guess.already_guessed?(params[:friend]) 
		 redirect_to :back, flash: {error: "You already made a guess for this question"} and return
		end

		#check session to see if this is a recently played
		@question = Question.last
		@guess = Guess.new
		session[:friend] = params[:friend]
		render "questions/guess"
	end

	def create
		 	guess = Guess.create(player: current_player, question: current_question,
		 					answer_id: params[:guess][:answer_id], friend_id: session[:friend])
		 	answer_bk = AnswerBook.where(question: question, player: session[:friend]).last
		 	if guess.check_answer?(answer_bk)
		 		current_player.correct_guess
		 		redirect_to player_recently_addeds_path(current_player), flash: {notice: "Correct! 10 points to you good sir."} and return
		 	else
		 		redirect_to player_recently_addeds_path(current_player), flash: {notice: "Incorrect. Try again next week"} and return
		 	end
	end

	private 

	def is_not_recent?(friend_id)
		RecentlyAdded.where(player: current_player, friend_id: friend_id).empty?		 
	end

	def no_answer_submitted?(friend_id)
		 AnswerBook.where(question: current_question, player_id: friend_id ).empty?	 
	end

	def already_guessed?(friend_id)
		Guess.where(question: current_question, player: current_player, friend_id: friend_id).present?
	end

	def check_answer?(guess, answer_bk)
		guess.answer_id == answer_bk.answer_id
	end				

end