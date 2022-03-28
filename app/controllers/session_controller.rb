class SessionController < ApplicationController
  skip_before_action :verify_login

  def login
    if current_user
      redirect_to dashboard_path
    end
  end

  def create
    if id_token = flash[:google_sign_in]['id_token']
      user_params = GoogleSignIn::Identity.new(id_token)
      if (!User.exists?(user_id: user_params.user_id))
        new_user = User.new
        new_user.user_id = user_params.user_id
        new_user.name = user_params.name
        new_user.email = user_params.email_address
        new_user.profile_img = user_params.avatar_url
        new_user.save!
      end

      session[:user_id] = user_params.user_id
      redirect_to dashboard_path
    else
      redirect_to session_path, alert: 'Login failed'
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to session_path
  end

end
