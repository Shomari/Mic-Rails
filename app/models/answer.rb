class Answer < ActiveRecord::Base
	belongs_to :question

	has_many :answer_books, :foreign_key => 'answer_id', :class_name => "AnswerBook"
end
