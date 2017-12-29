class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  	@user     = User.find(params[:user_id].to_s)
  	return render 'index'
  end

  def create
  	#@message = Message.new(message:params[:message], user:User.find(params[:user_id]))
  	@temp = params.require(:message).permit(:message)[:message]
  	@message = Message.new(message:@temp, user:User.find(params[:user_id]))
  	if @message.valid?
  		@message.save
  		return redirect_to messages_path params[:user_id]
  	else
  		flash[:failed] = @message.errors.full_messages
  		return redirect_to messages_path params[:user_id]
  	end
  end
end
