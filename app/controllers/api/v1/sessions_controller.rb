class Api::V1::SessionsController < Devise::SessionsController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    user = User.find_by(email: sign_in_params[:email])

    if !user.nil? && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render(json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity)
    end
  end
end
