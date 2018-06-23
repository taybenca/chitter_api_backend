class Peep < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates_presence_of :user, :body

  def as_json(options = {})
    super({ except: :user_id, methods: :user }.merge(options))
  end
end
