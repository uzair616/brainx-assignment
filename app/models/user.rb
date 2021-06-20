class User < ApplicationRecord
  has_many :user_repositories
  has_many :repositories , through: :user_repositories
  before_save  { self.email = email.downcase }
  validates :first_name, presence: true, length: { minimum: 5, maximum: 120 }
  validates :last_name, presence: true, length: { minimum: 5, maximum: 120 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    length: {minimum: 5, maximum: 120}, format: { with: VALID_EMAIL_REGEX }
end