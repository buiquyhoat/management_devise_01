class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :setup_user_seting, :load_notification

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

  def setup_user_seting
    if logged_in?
      user_setting.present? ? update_init_settings : create_user_setting
      user_setting
    end
  end

  def create_user_setting
    setting = default_user_setting
    user_setting = UserSetting.create user_id: current_user.id,
     user_settings_data: setting.to_json
  end

  def default_user_setting
    seting = {}
    seting[Settings.user_setting.send_mail_notification] = true
    seting[Settings.user_setting.order_by_unread_notification] = true
    seting[Settings.user_setting.quantity_load_notification] =
      Settings.paging.max_page_size
    seting[Settings.user_setting.page_size] = Settings.paging.page_size
    seting[Settings.user_setting.user_signal] = ""
    seting
  end

  def update_init_settings
    default_setting = default_user_setting
    default_setting.each do |k, v|
      if user_setting.optional_hash[k].nil?
        user_setting.optional_hash[k] = v
      end
    end
    user_setting.set_option
    user_setting.save
  end
end
