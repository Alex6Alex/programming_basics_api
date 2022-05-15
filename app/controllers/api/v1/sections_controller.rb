class Api::V1::SectionsController < ActionController::API
  def index
    sections = Section.preload(:lessons).all

    render(json: sections.as_json(include: :lessons))
  end
end
