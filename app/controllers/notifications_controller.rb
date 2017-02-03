class NotificationsController < ApplicationController
  before_action :logged_in_user
  before_action :init_notification, only: :show

  def index
  end

  def show
    @notification.checked = true
    if @notification.save
      redirect_to @notification.link
    end
  end

  private

  def init_notification
    @notification = Notification.find_by id: params[:id]
    unless @notification
      flash[:danger] = t "notification.message.notification_not_found"
      redirect_to root_path
    end
  end
end
