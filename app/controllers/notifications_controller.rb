class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(notifying_user: current_user.id).where(is_checked: false)
    respond_to do |f|
      f.js { render :index }
    end
  end

  def update
    notification = Notification.find_by(id: params[:id])
    notification.update(is_checked: true)
    params = notification.event.notification_params_hash
    redirect_to polymorphic_path([params[:path_model]])
  end
end
