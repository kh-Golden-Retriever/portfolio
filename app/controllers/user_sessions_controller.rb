class UserSessionsController < ApplicationController
  skip_before_action :require_login, except:[:destroy]
  skip_before_action :set_current_community, except:[:destroy]
  skip_before_action :set_notifications, except:[:destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email],params[:password])
    if @user
      redirect_back_or_to community_session_path
    else
      render :new
      flash.now[:danger] = 'failed'
    end
  end

  def destroy
    logout
    flash[:success] = 'success'
    session.delete(:community_id)
    redirect_to login_path
  end

end