class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, email: { strict_mode: true }

  has_many :links
end
