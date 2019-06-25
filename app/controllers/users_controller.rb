class UsersController < ApplicationController
  before_action:access_user,only:[:show,:edit,:update]
  before_action:set_user,only:[:show,:edit,:update]
  before_action:login_require,only:[:show,:edit,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  def update
    if @user.update(user_params)
    redirect_to user_path, notice:"編集しました"
    end
  end

  def show
  end



  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image,:image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def login_require
    redirect_to sessions unless current_user
  end


end
