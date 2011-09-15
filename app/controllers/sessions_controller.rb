class SessionsController < ApplicationController
	skip_before_filter :authorize

  def new
  end

  def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id
			redirect_to admin_path
		elsif User.count.zero?
			user = User.create(:name => params[:name], :password => params[:password], :password_confirmation => params[:password])	
			session[:user_id]	= user.id
			redirect_to admin_path, :alert => ("Admin user created")
		else
			redirect_to login_path, :alert => ("Invalid user/password combination" ) 
		end
  end

  def destroy
		session[:user_id] = nil
		redirect_to store_url, :notice => "Logged out"
  end
end
