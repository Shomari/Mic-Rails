class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answer_books, :foreign_key => 'player_id', :class_name => "AnswerBook"
  has_many :answers, through: :answer_books

  has_many :players_consoles
  has_many :consoles, through: :players_consoles

  has_many :recently_addeds

  def correct_guess
  	self.points = self.points + 10
  	self.save!
  end

end
