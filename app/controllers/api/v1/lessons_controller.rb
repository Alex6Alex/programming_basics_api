class Api::V1::LessonsController < ApplicationController
  def show
    lesson = Lesson.find(params[:id])

    render(json: lesson.as_json(include: :lesson_units))
  end
end
