class LessonUnit < ApplicationRecord
  belongs_to :lesson

  validates :content_block, :order, presence: true
  validates :order, uniqueness: { scope: :lesson_id }
end
