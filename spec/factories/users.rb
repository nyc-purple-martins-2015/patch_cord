FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name}
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    phone {Faker::PhoneNumber.phone_number}
    provider { :twitter }
    uid { [1,2,3,4,5].sample }  
  end
end