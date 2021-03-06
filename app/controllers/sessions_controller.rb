class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == Settings.remember ? remember(@user) : forget(@user)
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
end
