require 'faker'

FactoryGirl.define do
  factory :player do |f|
  	f.points { Faker::Number.number(3) }
  	f.email { Faker::Internet.email }
  	f.password { Faker::Internet.password(8) }
  	f.tagline "Best of the best"
    
  end

end
