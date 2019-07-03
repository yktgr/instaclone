class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def access_user
    if session[:user_id] == nil
      flash[:notice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end

  def edit_user
    @user = User.find_by(id: params[:id])
      if current_user.id != @user.id
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
  end

end
