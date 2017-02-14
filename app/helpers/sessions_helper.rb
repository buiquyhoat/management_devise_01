module SessionsHelper

  def log_in user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def user_setting
    if logged_in?
      @user_setting ||= UserSetting.find_by user_id: current_user.id
    end
  end

  def current_user? user
    user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def redirect_back_or default
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def generate_tag_color request
    case request.request_status_id
    when Settings.request_status.done
      "request_status done"
    when Settings.request_status.approved
      "request_status approved"
    when Settings.request_status.waiting_approve
      "request_status waitting_approve"
    when Settings.request_status.cancelled
      "request_status cancelled"
    end
  end

  def json_response success, message
    respond_to do |format|
      format.json do
        render json: {
          success: success,
          message: message
        }
      end
    end
  end

  def type_boolean value
    value.is_a?(TrueClass) || value.is_a?(FalseClass)
  end
end
