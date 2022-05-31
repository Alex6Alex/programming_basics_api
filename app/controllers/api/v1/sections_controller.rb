class Api::V1::SectionsController < Api::V1::BaseController
  def index
    @sections = Section.preload(:lessons).all
  end
end
