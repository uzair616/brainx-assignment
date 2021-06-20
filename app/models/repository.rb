class Repository < ApplicationRecord
  has_many :user_repositories
  has_many :users, through: :user_repositories
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 10, maximum: 360 }
end