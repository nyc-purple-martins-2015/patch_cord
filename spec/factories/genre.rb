FactoryGirl.define do
  factory :genre do
    name { Faker::Book.genre }    
  end
end