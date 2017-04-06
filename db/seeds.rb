require 'faker'

User.delete_all
Question.delete_all

20.times do
  User.create!( name: Faker::Name.name,
                username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "password" )
end

20.times do
  Question.create!( title: Faker::Hacker.ingverb,
                    description: Faker::Hacker.say_something_smart,
                    user_id: rand(1..20) )
end
