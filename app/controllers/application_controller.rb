class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit 

  # after_action :verify_policy_scoped, :only => :index 

  # jet ---below causing major problem of recursive render!!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized 


  private

  def set_locale
    I18n.locale = params[:locale] ||  I18n.default_locale
  end

  def default_url_options( options={} )
    {:locale => I18n.locale}
  end

  def user_not_authorized
    flash[:error] = "Unauthorized to perform this action."
    redirect_to user_session_path
  end 

end
