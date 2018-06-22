class User < ApplicationRecord
  has_many :peeps, dependent: :destroy

  validates_presence_of :handle, :password_hash

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def authenticate(password)
    BCrypt::Password.new(password_hash) == password
  end
end
