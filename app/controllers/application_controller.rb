class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  protected
  def authorize
    redirect_to login_path,
      :alert => "Please login or sign up" unless User.find_by_id(session[:user_id])
  end
end
