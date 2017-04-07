class Answer < ActiveRecord::Base
  belongs_to :answerable, polymorphic: true
  has_many :comments, as: :commentable
end
