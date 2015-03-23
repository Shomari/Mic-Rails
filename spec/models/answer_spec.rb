require 'rails_helper'

RSpec.describe Answer, :type => :model do

it { should have_many(:answer_books) }
end
