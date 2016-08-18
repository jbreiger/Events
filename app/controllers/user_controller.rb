class UserController < ApplicationController
before_action :require_login, except: [:index, :create]
before_action :require_correct_user, only: [:show, :edit]
  def index

  end
  def show
    @user=User.find(session[:user_id])
  end
  def edit
    @user=User.find(session[:user_id])
    puts @user.first_name
    @user.update(update_params)
    puts @user.first_name
    redirect_to "/events"
  end
  def create
  	user=User.new(user_params)
  	user.password_digest
  	if user.valid?
  		user.save
  		session[:user_id]= user.id
  		flash[:message]= "registered user"
  		redirect_to "/events"
  	else
  		puts "not valid"
  		flash[:error]= user.errors.full_messages
      puts flash[:error]
      redirect_to "/users"
  	end		
  	
  end
  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :state)
	end
  def update_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
  end
end
