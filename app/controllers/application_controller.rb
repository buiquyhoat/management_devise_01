class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :load_notification

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "user.require_logged"
      redirect_to login_url
    end
  end

  def set_created_by object
    object.created_by = current_user.id
    object.updated_by = current_user.id
  end

  def set_updated_by object
    object.updated_by = current_user.id
  end

  def is_number? string
    true if Float(string) rescue false
  end

  def load_notification
    if logged_in?
      limit =
        user_setting.optional_hash[Settings.user_setting.quantity_load_notification]
      limit ||= Settings.paging.page_size
      checked =
        user_setting.optional_hash[Settings.user_setting.order_by_unread_notification]
      @notifications = Notification.by_current_user(current_user.id)
        .limit(limit).sort_by_checked(checked).default_sort
    end
  end

  def config_page_size
    page_size = Settings.paging.page_size
    if user_setting.present?
      setting_page_size = user_setting.optional_hash[Settings.user_setting.page_size]
        if setting_page_size.to_i <  Settings.paging.min_page_size
          page_size = Settings.paging.page_size
        elsif setting_page_size.to_i >  Settings.paging.max_page_size
          page_size = Settings.paging.max_page_size
        else
          page_size = setting_page_size.to_i
        end
    end
    page_size
  end
end
