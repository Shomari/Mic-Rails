class AnswerBook < ActiveRecord::Base
	belongs_to :player
	belongs_to :question
	belongs_to :answer
end
