require 'faker'

20.times do
  User.create!( name: Faker::Name.name,
                username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "password" )
end


50.times do
  Question.create!( title: Faker::Hipster.sentence,
                    description: Faker::Hipster.paragraph,
                    user_id: rand(1..20)
    )
end
