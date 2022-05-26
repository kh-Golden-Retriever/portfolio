class ApplicationController < ActionController::Base
  add_flash_types :success, :danger, :warning, :info
  before_action :require_login
  before_action :set_current_community
  before_action :set_notifications

  private

  def not_authenticated
    redirect_to login_path
  end

  def set_current_community
    if session[:community_id]
      @current_community ||= Community.find(session[:community_id])
    end
  end

  def set_notifications
    @notifications = Notification.where(notifying_user: current_user.id).where(is_checked: false)
  end

end
