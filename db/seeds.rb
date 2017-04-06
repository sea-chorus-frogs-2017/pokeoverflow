require 'faker'

20.times do
  User.create!( name: Faker::Name.name,
                username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "password" )
end
