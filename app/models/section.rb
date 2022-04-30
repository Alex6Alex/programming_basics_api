class Section < ApplicationRecord
  has_many :lessons

  validates :name, :order, presence: true
  validates :order, uniqueness: true
end
