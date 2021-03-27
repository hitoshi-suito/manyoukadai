class Label < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :labeling, dependent: :destroy
end
