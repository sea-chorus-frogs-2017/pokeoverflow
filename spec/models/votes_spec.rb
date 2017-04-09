require 'spec_helper'

describe Vote do
  describe 'associations' do
      let(:user1) {User.create!(  name: "John Doe",
                                    username: "Johnnyboi",
                                    email: "jbgmail.com",
                                    password: "password" )}

      let(:user2) {User.create!(  name: "Harper Scott",
                                    username: "HarpMaster",
                                    email: "Harper@gmail.com",
                                    password: "password" )}

      let(:question) {Question.create!( title: "What is a dolphin?",
                                    description: "I do not understand marine life, can you help...",
                                    user_id: user1.id)}

      let(:comment) {Comment.create!( content: "Great question",
                                    user_id: user2.id,
                                    commentable_id: 1,
                                    commentable_type: "Question" )}

      let(:answer) {Answer.create!( content: "A dolphin is a an intelligent mammal!",
                                question_id: 1,
                                user_id: user2.id)}

      let(:question_vote) {Vote.create!(  value: 1,
                                      user_id: user2.id,
                                      voteable_id: 1,
                                      voteable_type: "Question")}

      let(:comment_vote) {Vote.create!( value: 1,
                                    user_id: user1.id,
                                    voteable_id: 1,
                                    voteable_type: "Comment")}

      let(:answer_vote) {Vote.create!(  value: 1,
                                    user_id: user1.id,
                                    voteable_id: 1,
                                    voteable_type: "Answer")}

    it 'returns a value for a vote on a question' do
      expect(question_vote.value).to eql(1)
    end

    it 'returns a value for a vote on a comment' do
      expect(comment_vote.value).to eql(1)
    end

    it 'returns a value for a vote on a answer' do
      expect(answer_vote.value).to eql(1)
    end

    it 'has a user who made the vote on a question' do
      expect(question_vote.user_id).to eq(user2.id)
    end

    it 'has a user who made the vote on a answer' do
      expect(answer_vote.user_id).to eq(user1.id)
    end

    it 'has a user who made the vote on a comment' do
      expect(comment_vote.user_id).to eq(user1.id)
    end
  end
end
