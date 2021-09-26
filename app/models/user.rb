class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_many :reservations
  has_secure_password

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

end
