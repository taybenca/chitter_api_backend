class Like < ApplicationRecord
  belongs_to :user
  belongs_to :peep

  validates_presence_of :user, :peep
end
