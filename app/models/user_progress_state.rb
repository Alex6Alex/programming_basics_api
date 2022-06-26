class UserProgressState < ApplicationRecord
  belongs_to :user
  belongs_to :learn_unit, polymorphic: true

  enum state: { passed: 1 }

  validates :state, presence: true
  validates :user_id, uniqueness: { scope: %i[learn_unit_id learn_unit_type] }
end
