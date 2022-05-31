class Api::V1::LessonsController < Api::V1::BaseController
  def show
    @lesson = Lesson.find(params[:id])
  end
end
