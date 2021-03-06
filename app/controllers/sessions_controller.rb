class SessionsController < ApplicationController

	def index
		@player = current_player
		console = Console.where(name: session[:console])
		pc = PlayersConsole.where(player: current_player, console: console).first
		
		if pc == nil
			redirect_to player_show_path(@player), notice: "You don't have a tag associated with this console." and return 
		end	
		
		session[:psgames] == "" ? holder = session[:xbgames] : holder = session[:psgames]	
		@console_game = ConsolesGame.find(holder)

		@recently_added = RecentlyAdded.new		
		@sessions = Session.get_active_session(@console_game, pc.id)
		Session.create_session(@console_game, pc)

		render :index	
	end

	def check_question
		@question = Question.last
		check = AnswerBook.where({player: current_player, question: @question}).first
		session[:console] = params[:console]
		session[:psgames] = params[:psgames]
		session[:xbgames] = params[:xbgames]
		if check == nil			
			return redirect_to question_path(@question)
		else
			return redirect_to(controller: 'sessions', action: 'create')			
		end
	end

	#I need to post to here from ab_controller#create but can't redirect to a post
	#method so had to duplicate code in index
	def create
		player = current_player
		console = Console.where(name: session[:console])
		pc = PlayersConsole.where(player: player, console: console).first
		
		if pc == nil
			redirect_to player_show_path(player), notice: "You don't have a tag associated with this console." and return
		end
	
		
		if params[:psgames] == ""
			holder = session[:xbgames]
		else
			holder = session[:psgames]
		end
		game = ConsolesGame.find(holder)
		@sessions = Session.includes(:players_console, :players).where('(consoles_game_id = ? AND created_at > ?)', game, Time.now - 1.hour).order('random()').first(6)
		Session.find_or_create_by(consoles_game: game, players_console: pc)		
		render :index
	end

	private

	def session_parms
		params.require(:session).permit(:console, :consoles_game)
	end

end