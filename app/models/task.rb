class Task < ApplicationRecord
  belongs_to :user
  validates :details, presence: true

end
