class Api::V1::SessionsController < Devise::SessionsController
  # protect_from_forgery unless: -> { request.format.json? }
end