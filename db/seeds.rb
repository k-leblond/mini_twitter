# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Destroying users..."
User.destroy_all

puts "Creating new users...."

chuck = User.create!(email: "chuck@norris.com", password: "123456", name: "Chuck Norris")
gandalf = User.create!(email: "gandalf@grey.com", password: "123456", name: "Gandalf")
harry = User.create!(email: "harry@potter.com", password: "123456", name: "Harry Potter")
anakin = User.create!(email: "anakin@skywalker.com", password: "123456", name: "Anakin Skywalker")
yoda = User.create!(email: "yoda@starwars.com", password: "123456", name: "Yoda")
shakespear = User.create!(email: "shake@spear.com", password: "123456", name: "Shakespear")
rick = User.create!(email: "rick@morty.com", password: "123456", name: "Rick Sanchez")
jake = User.create!(email: "jake@peralta.com", password: "123456", name: "Jake Peralta")
maurice = User.create!(email: "maurice@moss.com", password: "123456", name: "Maurice Moss")

puts "Users created!"

puts "Creating followers/followings"
users = User.all
user = users.first
following = users[1..9]
followers = users[3..7]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts "Done!"

puts "Creating posts...."

puts "Starting chuck"
10.times do
  Post.create!(content: Faker::ChuckNorris.fact, user_id: chuck.id)
end

puts "Chuck done"

10.times do
  Post.create!(content: Faker::Movies::Hobbit.quote, user_id: gandalf.id)
end

puts "Gandalf done"

10.times do
  Post.create!(content: Faker::Movies::HarryPotter.quote, user_id: harry.id)
end

puts "Harry done"

10.times do
  Post.create!(content: Faker::Movies::StarWars.quote, user_id: anakin.id)
end

puts "Anakin done"

10.times do
  Post.create!(content: Faker::Quote.yoda, user_id: yoda.id)
end

puts "Yoda done"

10.times do
  Post.create!(content: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, user_id: shakespear.id)
end

puts "Shakespear done"

10.times do
  Post.create!(content: Faker::TvShows::RickAndMorty.quote, user_id: rick.id)
end

puts "Rick done"

# 10.times do
#   Post.create!(content: Faker::TvShows::BrooklynNineNine.quote, user_id: jake.id)
# end

# puts "Jake done"

10.times do
  Post.create!(content: Faker::TvShows::TheITCrowd.quote, user_id: maurice.id)
end

puts "Maurice done"
