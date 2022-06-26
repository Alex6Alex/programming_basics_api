class Api::V1::BaseController < ApplicationController
  before_action :parse_token, :authenticate_user!

  private

  def parse_token
    puts request.headers

    return if request.headers['Authorization'].blank?

    authenticate_or_request_with_http_token do |token|
      jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

      @current_user_id = jwt_payload['id']
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      puts @current_user_id
      head(:unauthorized)
    end
  end

  def authenticate_user!
    head(:unauthorized) unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end