require 'rails_helper'

RSpec.describe Console, :type => :model do
	let (:console){ FactoryGirl.build(:console) }

	it 'has a valid factory' do
		expect(console).to be_valid
	end
end
