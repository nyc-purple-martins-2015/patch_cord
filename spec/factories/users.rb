FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name}
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    phone {Faker::PhoneNumber.phone_number}
    
  end
end