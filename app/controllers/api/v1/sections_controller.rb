class Api::V1::SectionsController < Api::V1::BaseController
  def index
    redirect_to('https://google.com/')
    # @sections = Section.preload(:lessons).all
  end
end
