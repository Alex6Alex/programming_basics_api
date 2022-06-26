class Lesson < ApplicationRecord
  belongs_to :section

  has_many :lesson_units
  has_many :user_progress_states, as: :learn_unit, dependent: :destroy

  validates :name, :description, :order, presence: true
  validates :order, uniqueness: { scope: :section_id }
end
