class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def access_user
    if session[:user_id] == nil
      flash[:notice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end
end
