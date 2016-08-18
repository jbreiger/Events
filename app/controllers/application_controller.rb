class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   def require_login
    redirect_to '/users' if session[:user_id] == nil
  end
  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  	end
 
  def current_user

    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
 
  protect_from_forgery with: :exception
end
