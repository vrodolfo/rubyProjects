class CommentsController < ApplicationController
  def create
  	comment = Comment.new(user:current_user, event:Event.find(params[:event_id]), comment:params[:comment])
  	if comment.valid?
  		comment.save
  	else
  		flash[:failed] = comment.errors.full_messages
  	end
  	return redirect_to eventsShow_path params[:event_id]
  end
end
