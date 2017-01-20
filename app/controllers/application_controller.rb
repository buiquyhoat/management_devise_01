class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def render_popup template
    respond_to do |format|
      format.html {render template, layout: "popup"}
    end
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "user.require_logged"
      redirect_to login_url
    end
  end
end
