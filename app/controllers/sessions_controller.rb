class SessionsController < ApplicationController
  def new
  end

  def create
=begin 
	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		params[:session][:remember_me] == '1' ? remember(user) : forget(user) # With ternary operators you cannot use remember user but have to user remember(user).
  		redirect_to user  # user is same as user_url(user) here.
=end
	# The above code is with the local variable.
	# We are adding @ infront of users to make it to an instance variable instead of a local 
	# variable as to access the cookie through test so it's not virtual cookie anymore.
	# This also allows us to use assigns in the test "login with remembering" to check the cookie.
	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user
  		params[:session][:remember_me] == '1' ? remember(@user) : forget(@user) # With ternary operators you cannot use remember user but have to user remember(user).
  		redirect_back_or @user  # user is same as user_url(user) here.
  	else
  		flash.now[:danger] = "Invalid email/password combination" 
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end


end
