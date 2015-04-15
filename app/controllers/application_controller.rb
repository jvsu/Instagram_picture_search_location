class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #don't know how to write a test for this. 
  private
  def current_user
  	User.where(id: session[:user_id]).first
  end
  helper_method :current_user #lets variable become available in the view
end
