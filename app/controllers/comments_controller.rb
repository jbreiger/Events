class CommentsController < ApplicationController
before_action :require_login
def create
	@user= User.find(session[:user_id])
	@event= Event.find(params[:event_id])
	Comment.create(comment: params[:comment], event: @event, user: @user)
	
	@comments=@event.comments
	#@comments=Comment.all
	redirect_to "/events/#{@event.id}"


end
end
