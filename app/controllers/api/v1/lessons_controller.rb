class Api::V1::LessonsController < ActionController::API
  def show
    lesson = Lesson.find(params[:id])

    render(json: lesson.as_json(include: :lesson_units))
  end
end
