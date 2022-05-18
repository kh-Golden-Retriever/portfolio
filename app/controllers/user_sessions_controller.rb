class UserSessionsController < ApplicationController
  skip_before_action :require_login, except:[:destroy]

  def new

  end

  def create
    @user = login(params[:email],params[:password])
    if @user
      redirect_back_or_to(root_path)
    else
      render :new
      flash.now[:danger] = 'failed'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
