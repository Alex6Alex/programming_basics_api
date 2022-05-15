class Api::V1::SectionsController < ActionController::API
  def index
    @sections = Section.preload(:lessons).all
  end
end
