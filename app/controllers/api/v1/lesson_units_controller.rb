class Api::V1::LessonUnitsController < Api::V1::BaseController
  protect_from_forgery unless: -> { request.format.json? }

  def pass
    LessonUnit.find(params[:id]).user_progress_states.create!(user: current_user, state: 1)
  end
end
