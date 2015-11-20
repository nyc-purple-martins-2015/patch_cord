FactoryGirl.define do
  factory :band do
    name { Faker::Book.title }
    bio { Faker::Hacker.say_something_smart }
    admin_id {FactoryGirl.create(:user).id}
  end
end
