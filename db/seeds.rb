require 'faker'

User.delete_all
Question.delete_all

50.times do
  User.create!( name: Faker::Name.name,
                username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: "password" )
end

50.times do
  Question.create!( title: Faker::Hipster.sentence,
                    description: Faker::Hipster.paragraph,
                    user_id: rand(1..50)
    )
end

50.times do
  Comment.create!(  content: Faker::Hipster.sentence,
                    user_id: rand(1..50),
                    commentable_id: rand(1..50),
                    commentable_type: "Question" )
end

100.times do
  Answer.create!( content: Faker::Hipster.sentence,
                  question_id: rand(1..70),
                  user_id: rand(1..20))

end
