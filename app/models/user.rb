class User < ApplicationRecord
  has_secure_password
  has_many :links

  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true
  validates :email, email: { strict_mode: true }
end
