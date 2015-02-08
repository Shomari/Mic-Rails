module PlayersHelper
	def xbox
		Console.where(name: "XB1")
	end

	def xbox_games
		ConsolesGame.where(console: xbox).map(&:game)		
	end

	def ps
		Console.where(name: "PS4")	
	end

	def ps_games
		ConsolesGame.where(console: ps).map(&:game)
	end
end