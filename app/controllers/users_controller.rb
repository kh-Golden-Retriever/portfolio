class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]
  skip_before_action :require_login, only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'success'
      redirect_to login_path
    else
      flash.now[:danger] = 'failed'
      render :new
    end
  end

  def edit

  end

  def update
  
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
