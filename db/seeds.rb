# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file = File.open("users_list.txt", "w")

user = User.create!(name:  "Do's Xuan's Tho's",
             email: "gonepas08@gmail.com",
             password:              "123456789",
             password_confirmation: "123456789",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
user.microposts.create!(content: "feeling boring")
user.microposts.create!(content: "dogs is so funny, haha https://www.youtube.com/watch?v=GF60Iuh643I")
user.microposts.create!(content: "feeling happy")
user.microposts.create!(content: "feeling tired")
user.microposts.create!(content: "feeling sad")
user.microposts.create!(content: "feeling nothing")

			file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"



user = User.create!(name:  "Big Pudge",
             email: "gonepas07@gmail.com",
             password:              "freshmeat123",
             password_confirmation: "freshmeat123",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
user.microposts.create!(content: "feeling hungry")
user.microposts.create!(content: "i will, i will, HOOK you")
user.microposts.create!(content: "feeling .....")
user.microposts.create!(content: "i can smell you")
user.microposts.create!(content: "feeling sad")
user.microposts.create!(content: "feeling nothing in my stomatch")
    file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"




user = User.create!(name:  "Windranger",
             email: "gonepas01@gmail.com",
             password:              "123456789",
             password_confirmation: "123456789",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
user.microposts.create!(content: "i run like the wind")
user.microposts.create!(content: "it's my raining arrows")
user.microposts.create!(content: "hmm.... OK")
user.microposts.create!(content: "i miss you, Magina")
user.microposts.create!(content: "feeling sad")
user.microposts.create!(content: "focus FIREEEEEEEEEEEEE!")
            
			file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"


user = User.create!(name:  "Crystal Maiden",
             email: "gonepas18@gmail.com",
             password:              "987654321",
             password_confirmation: "987654321",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
user.microposts.create!(content: "Let it go, let it gooooooo")
user.microposts.create!(content: "wanna meet you, Elsa")
user.microposts.create!(content: "FREZEE")
user.microposts.create!(content: "come and play with me, Tusk")
user.microposts.create!(content: "Lina, you're so hot, but i'm cooler than u")
user.microposts.create!(content: "Help, Pudge is hereeee!")
    file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"


user = User.create!(name:  "Lina The hottie",
             email: "gonepas09@gmail.com",
             password:              "hahahahaha",
             password_confirmation: "hahahahaha",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
user.microposts.create!(content: "GTFO")
user.microposts.create!(content: "Burning up")
user.microposts.create!(content: "Laguna balade")
user.microposts.create!(content: "i hate you, Rylai")
user.microposts.create!(content: "Rylai, i will kill you")
user.microposts.create!(content: "Go away Pudge!")
    file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"

50.times do |n|
  name  = Faker::HarryPotter.character
  email = "member_number-#{n+1}@gmail.com"
  password = ["passwordhere", name.split(" ").sample + "123", "mypassword", "theamazingspiderman", "bigblack", "sadboy_of_universe"].sample + rand(12345).to_s
  user = User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
  50.times do
  content = Faker::HarryPotter.quote
  user.microposts.create!(content: content)
  end

  file.puts user.name + "\n" + user.email + "\n" + user.password + "\n\n\n"
end

users = User.all
user = users.first
following = users[2..10]
followers = users[3..8]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
file.close