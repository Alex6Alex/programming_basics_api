json.array! @sections do |section|
  json.(section, :id, :name, :description, :order, :created_at, :updated_at)
  json.lessons section.lessons do |lesson|
    json.(lesson, :id, :name, :description, :order, :section_id, :created_at, :updated_at)
  end
end
