class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      init_data_logic
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
  def init_data_logic
    clear_data
    if @current_user.present?
      if @current_user.can_manage_request
        if @current_user.can_make_request
          user_can_approve
        end
        if @current_user.can_approve
          user_can_waiting_done
        end
        if @current_user.can_waiting_done
          user_can_done_request
        end
      end
    end
  end

  def clear_data
    $user_can_approve = nil
    $user_can_done = nil
    $user_can_waiting_done = nil
  end
  def create_user_setting
    setting = default_user_setting
    user_setting = UserSetting.create user_id: current_user.id,
     user_settings_data: setting.to_json
  end
end
