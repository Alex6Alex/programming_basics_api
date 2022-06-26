json.(@lesson, :id, :name, :description, :order, :section_id, :created_at, :updated_at)
json.lesson_units @lesson.lesson_units do |lesson_unit|
  json.(lesson_unit, :id, :content_block, :order, :lesson_id, :created_at, :updated_at)
  json.is_passed(lesson_unit.passed?(current_user))
end
