class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  
  def current_user 
  	return User.find(session[:user_id])
  end
  helper_method

  private
    def require_login
      return redirect_to sessionsNew_path unless session[:user_id]
    end
end
