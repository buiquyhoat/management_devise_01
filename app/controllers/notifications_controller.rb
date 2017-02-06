class NotificationsController < ApplicationController
  before_action :logged_in_user
  before_action :init_notification, only: :show
  before_action :init_data

  def index
    @notifications = Notification.by_current_user(current_user.id)
      .created_from_date(params[:from_date])
      .created_to_date(params[:to_date])
      .sender_by(params[:sender_id])
      .default_sort
      .paginate page: params[:page]
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

  def init_data
    @support = Supports::User.new current_user
  end
end
