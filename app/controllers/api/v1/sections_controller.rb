class Api::V1::SectionsController < Api::V1::BaseController
  def index
    redirect_to('https://google.com/', allow_other_host: true)
    # @sections = Section.preload(:lessons).all
  end
end
