class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  	session[:user_id] = nil
  	flash[:message]= "You Are Logged Off"
  	redirect_to '/search/index'
  end
end
