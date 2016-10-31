class User < ApplicationRecord
  has_secure_password

  validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, email: { strict_mode: true }
end
