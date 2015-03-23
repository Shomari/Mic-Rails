FactoryGirl.define do
  factory :session do
    association :player, factory: :player, strategy: :build
  end

end
