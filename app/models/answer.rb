class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :voteable

  def username
    self.user.username
  end
end
