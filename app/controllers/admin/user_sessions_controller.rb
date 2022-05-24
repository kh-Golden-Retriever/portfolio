class Admin::UserSessionsController < Admin::BaseController
  protect_from_forgery :except => [:new, :create]
  skip_before_action :require_login, only: %i[ new create ]
  layout 'admin/layouts/session_layout'

  def new; end

  def create
    if @user = login(params[:email],params[:password])
      redirect_back_or_to admin_root_path, success:'success'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_admin_login_path
  end
end
