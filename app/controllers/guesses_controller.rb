class GuessesController < ApplicationController

	def index
		recently_added = RecentlyAdded.find(params[:recently_added_id])
		if RecentlyAdded.is_not_recent?(current_player, recently_added.friend_id)
		 redirect_to :back, flash: {error: "You haven't recently played with this player"} and return
		elsif AnswerBook.no_answer_submitted?(current_question, recently_added.friend_id)
		 redirect_to :back, flash: {error: "This person hasn't answered this question yet"} and return
		elsif Guess.already_guessed?(current_player, current_question, recently_added.friend_id)
		 redirect_to :back, flash: {error: "You already made a guess for this question"} and return
		end

		#check session to see if this is a recently played
		@question = Question.last
		@guess = Guess.new
		session[:friend] = recently_added.friend_id
		render "questions/guess"
	end

	def create
	 	guess = Guess.create(player: current_player, question: current_question,
	 					answer_id: params[:guess][:answer_id], friend_id: session[:friend])
	 	answer_bk = AnswerBook.where(question: current_question, player: session[:friend]).last
	 	if guess.check_answer?(answer_bk)
	 		current_player.correct_guess
	 		redirect_to player_recently_addeds_path(current_player), flash: {notice: "Correct! 10 points to you good sir."} and return
	 	else
	 		redirect_to player_recently_addeds_path(current_player), flash: {notice: "Incorrect. Try again next week"} and return
	 	end
	end		

end