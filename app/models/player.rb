class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answer_books, :foreign_key => 'player_id', :class_name => "Answer_book"
  has_many :answers, through: :players_answers

  has_many :players_consoles
  has_many :consoles, through: :players_consoles

end
