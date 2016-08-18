class SessionsController < ApplicationController
	def create
		user= User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			flash[:message]= ["Good login"]
			session[:user_id]= user.id
			redirect_to "/events"

		else 
			flash[:error]= ["bad login credentials"]
			redirect_to "/users"
		end	
	end
	def destroy
	session[:user_id]= nil
	redirect_to '/users'
	end
	# def session_params
 #  params.require(:session).permit(:email, :password)
	#end 
end
