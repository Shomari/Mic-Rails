class SessionsController < ApplicationController

	def index
		
	end

	def check_question
		@question = Question.last
		check = AnswerBook.where({player: current_player, question: @question}).first
		if check == nil		
			redirect_to question_path(@question)
		else
			redirect_to sessions_path(request.parameters)
		end

		#check = players_answer where player_id = player
		#if check.question_id = this_weeks_question method => create
		#else
		#render question ask page
	end

	def create
		player = current_player
		binding.pry
		console = Console.where(name: params[:console])
		pc = PlayersConsole.where(player: player, console: console).first
		
		redirect_to player_show_path(player), notice: "You don't have a tag associated with this console." and return if pc == nil
	
		
		if params[:psgames] == ""
			holder = params[:xbgames]
		else
			holder = params[:psgames]
		end
		game = ConsolesGame.find(holder)
		Session.create(consoles_game: game, players_console: pc)
		@sessions = Session.where('(consoles_game_id = ? AND created_at > ?)', game, Time.now - 1.hour)
		
		render :index
	end

	private

	def session_parms
		params.require(:session).permit(:console, :consoles_game)
	end

end