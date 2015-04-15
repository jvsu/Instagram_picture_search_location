class UsersController < ApplicationController
  def new
    
  end

  def create
  	@user = User.new(user_params) # put params into database
  	# @user.password = user_params[:password]
  	# @user.save! # save it
  	if @user.save 
  		# if the save is successful then create a session id 
  		session[:user_id]= @user.id
  		redirect_to "/search/index"
  	else
      #add note if not successful 
      flash[:message] = 'Inputs Not Correct'
  		redirect_to "/users/new"
  	end
  end

  def login
  	@user = User.find_by_email(login_params[:email])
  	if @user && @user.authenticate(login_params[:password])
  		#create session
  		session[:user_id] = @user.id
  		redirect_to "/search/index"

  	else
  		flash[:message] = 'Email or Password Not Correct'
  		redirect_to '/users/new'
  	end
  end

 private
 	def user_params
 		params.require(:user).permit(:first_name, :last_name, :password, :email, :user_name)
 	end
 	def login_params
 		params.require(:user).permit(:password, :email)
 	end

end
