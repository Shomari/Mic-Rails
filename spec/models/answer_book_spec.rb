require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe AnswerBook, :type => :model do

	it {should belong_to(:player)}
	it {should belong_to(:question)}
	it {should belong_to(:answer)}

end
