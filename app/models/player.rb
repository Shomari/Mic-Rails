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

  def forem_name
    handle
  end

  def xbox_tag
    PlayersConsole.where(player: self, console_id: 1).first.gtag
  end

  def ps4_tag
    PlayersConsole.where(player: self, console_id: 2).first.gtag
  end

end
