class EventsController < ApplicationController
 before_action :require_login
#before_action :require_correct_user, only: [:show]
  def index
  	@states = {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arizona" => "AZ"
    }
	@user=User.find(session[:user_id])
  	@user_state= @user.state
  	@events= Event.all

  	
  	#@full_name= @user.first_name + " " + @user.last_name
  	# @events.each do |x|
  # end
  # <% if s.users_liked.include?(@user) %>
	end
  def show
  	@user=User.find(session[:user_id])
  	@event= Event.find(params[:id])
  	@users_attending= @event.users
  	puts @users_attending
  	@comments=@event.comments

  end
  def create
  	@event_date= params[:event][:date]
  	@event_date= @event_date.to_time.to_i
  	@today= Date.today.to_time.to_i
  	if @event_date<@today
  		flash[:error]= ["You need to pick a future date"]
  	else 
  		@event=Event.new(event_params)
  		if @event.valid?
  			@event.save
  			@user=User.find(session[:user_id])
  			#@full_name= @user.first_name + " " + @user.last_name
  			#puts @full_name
  			@event.update(host: @user.first_name)
  			puts @event.host
  		else
  			flash[:error]= ["Something is not right"]
  		end
  	end		
  	# if @event > 
  	#@event=
  	redirect_to "/events"
  end
  def destroy
    @event= Event.find(params[:id])
    @event.destroy
    redirect_to "/events"
  end
  def event_params
  params.require(:event).permit(:name, :date, :city, :state)
end
end
