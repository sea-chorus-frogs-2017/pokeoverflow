class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, as: :answerable
  has_many :comments, as: :commentable
end
