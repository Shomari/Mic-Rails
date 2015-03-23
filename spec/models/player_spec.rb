require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Player, :type => :model do

	let(:player) { FactoryGirl.create(:player) }

	it 'has a valid factory' do
		expect(player).to be_valid
	end

	it { is_expected.to have_many(:players_consoles) }
	it { should have_many(:consoles) }

	# it { should have_many(:answers) }
	it { should have_many(:answer_books) }

	it 'should add points if correct_guess is called' do
		expect{player.correct_guess}.to change{player.points}.by(10)
	end

end
