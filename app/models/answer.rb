class Answer < ActiveRecord::Base
  belongs_to :answerable, polymorphic: true
end
