class Player < ActiveRecord::Base
	has_many :players_consoles
	has_many :consoles, through: :players_consoles

	validates :email, :email => true, uniqueness: true
	validates :password, length: { minimum: 8 }
end
