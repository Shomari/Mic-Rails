class Question < ActiveRecord::Base
	has_many :answers
  has_many :answer_books, :foreign_key => 'question_id', :class_name => "AnswerBook"
end
