class LessonUnit < ApplicationRecord
  belongs_to :lesson

  has_many :user_progress_states, as: :learn_unit, dependent: :destroy

  validates :content_block, :order, presence: true
  validates :order, uniqueness: { scope: :lesson_id }

  def passed?(user)
    user_progress_states.exists?(user:, state: 1)
  end
end
