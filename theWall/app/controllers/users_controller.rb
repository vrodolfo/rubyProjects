class UsersController < ApplicationController
  def index
  	return render 'index'
  end

  def create
  	#@user = User.find_by(username:params[:username])
  	@user = User.find_by(params.require(:user).permit(:username))
  	if @user
  		return redirect_to messages_path @user.id
  	else
  		#@user = User.new(username:params[:username])
  		@user = User.new(params.require(:user).permit(:username))
  		if @user.valid?
  			@user.save
  			return redirect_to messages_path @user.id
  		else
  			flash[:failed] = @user.errors.full_messages
  			return redirect_to root_path
  		end
  	end
  end
end
