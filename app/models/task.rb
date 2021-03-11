class Task < ApplicationRecord
  validates :details, presence: true
  validates :title, presence: true
end
