class User < ActiveRecord::Base

  has_secure_password

  has_many :movies

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

end
