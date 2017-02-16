class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == Settings.remember ? remember(@user) : forget(@user)
      user_setting.present? ? update_new_settings : create_user_setting
      redirect_back_or root_url
    else
      flash.now[:danger] = t "session.invalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def create_user_setting
    setting = default_user_setting
    user_setting = UserSetting.create user_id: current_user.id,
     user_settings_data: setting.to_json
  end

  def default_user_setting
    seting = {}
    seting[Settings.user_setting.send_mail_notification] = true
    seting[Settings.user_setting.page_size] = Settings.paging.page_size
    seting[Settings.user_setting.user_signal] = ""
    seting
  end

  def update_new_settings
    default_setting = default_user_setting
    default_setting.each do |k, v|
      unless user_setting.optional_hash[k].present?
        user_setting.optional_hash[k] = v
      end
    end

    user_setting.set_option
    user_setting.save
  end
end
