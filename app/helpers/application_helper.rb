module ApplicationHelper

	def current_question
		Question.last
	end
end
