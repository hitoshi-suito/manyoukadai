class Task < ApplicationRecord
  validates :details, presence: true
  validates :title, presence: true
  validates :expired_at, presence: true
end
