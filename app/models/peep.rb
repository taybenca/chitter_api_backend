class Peep < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates_presence_of :user, :body
end
