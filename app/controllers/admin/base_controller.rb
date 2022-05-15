class Admin::BaseController < ApplicationController
  layout 'admin_application'

  protect_from_forgery prepend: true
  before_action :authenticate_user!
end