class Api::V1::LessonsController < ActionController::API
  def show
    @lesson = Lesson.find(params[:id])
  end
end
