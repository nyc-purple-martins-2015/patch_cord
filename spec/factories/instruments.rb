FactoryGirl.define do
  factory :instrument do
  	association :user
    name { Faker::Team.creature }    
  end
end