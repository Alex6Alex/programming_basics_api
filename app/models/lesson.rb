class Lesson < ApplicationRecord
  belongs_to :section
  has_many :lesson_units

  validates :name, :description, :order, presence: true
  validates :order, uniqueness: { scope: :section_id }
end
