require 'rails_helper'

RSpec.describe Session, :type => :model do

	let(:session){FactoryGirl.build(:session)}

	it { is_expected.to belong_to(:players_console)}

	it 'has a valid factory' do
		expect(session).to be_valid
	end

	it 'finds active sessions' do
		FactoryGirl.create(:session)
		expect(Session.check_actives.count).to eq(1)
	end
end
