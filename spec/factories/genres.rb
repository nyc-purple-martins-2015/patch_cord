FactoryGirl.define do
  factory :genre do
    name { Faker::Book.title }    
  end
end