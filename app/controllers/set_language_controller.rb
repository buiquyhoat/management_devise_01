class SetLanguageController < ApplicationController

  def change_language
    case params[:language]
    when Settings.languages.english
      I18n.locale = :en
      session[:language] = t "language.english"
    when Settings.languages.japan
      I18n.locale = :jp
      session[:language] = t "language.japan"
    else
      I18n.locale = I18n.default_locale
    end
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale
    redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to :root
  end
end
