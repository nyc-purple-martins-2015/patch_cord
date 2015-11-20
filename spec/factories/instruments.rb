FactoryGirl.define do
  factory :instrument do
    username { Faker::Team.creature }    
  end
end