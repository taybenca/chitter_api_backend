class User < ApplicationRecord
  has_many :peeps, dependent: :destroy

  validates_presence_of :handle, :password_hash
end
