class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  before_validation { email.downcase! }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

  has_many :tasks, dependent: :destroy

  before_destroy :can_not_destroy_last_admin
  before_update :can_not_update_last_admin
  
  private
  def can_not_destroy_last_admin
    throw(:abort) if User.where(admin: true).count == 1 
  end

  def can_not_update_last_admin
    throw(:abort) if User.where(admin: true).count == 0
  end
end
