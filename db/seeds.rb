# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mae = User.create(username: "mae", password: "password", email: "mae@gmail.com", address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraph(2))

andre = User.create(username: "andre", password: "password", email: "andre@gmail.com", address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraph(2))

alexis = User.create(username: "alexis", password: "password", email: "alexis@gmail.com", address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraph(2))

dom = User.create(username: "dom", password: "password", email: "dom@gmail.com", address_line1: Faker::Address.street_address, address_line2: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraph(2))

users = [dom, andre, alexis, mae]

rolling_stoned = Band.create(name: "Rolling Stoned", bio: Faker::Lorem.paragraph(1), admin_id: users.sample.id)

rolling_stoned.users << mae
rolling_stoned.users << andre
rolling_stoned.users << dom

users.each do |user|
  user.instruments.create(name: Faker::Team.creature)
  user.genres.create(name: Faker::Book.title)
  user.media_resources.create(content: Faker::Lorem.paragraph(1), link: Faker::Internet.url)
end

rolling_stoned.media_resources.create(content: Faker::Lorem.paragraph(1), link: Faker::Internet.url)
