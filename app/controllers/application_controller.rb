class ApplicationController < ActionController::Base
  before_action :verify_login

  def current_user
    @user ||= User.find_by(user_id: session[:user_id])
  end

  private
  def verify_login
    if current_user.nil?
      redirect_to session_path
    end
  end
end
