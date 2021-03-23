class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  before_validation { email.downcase! }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

  has_many :tasks, dependent: :destroy
end
