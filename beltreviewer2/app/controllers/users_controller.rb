class UsersController < ApplicationController
  skip_before_action :require_login, :auth, only: [:new, :create]

  before_action :auth
  def auth
    if session[:user_id].to_s != params[:user_id].to_s
      return redirect_to usersShow_path session[:user_id]
    end
  end

  def show
  	@current_user = current_user
  end

  def index
    return redirect_to eventsIndex_path
  end

  def new
  end

  def edit
  	@current_user = current_user
  end

  def update
  	user = current_user
  	user.first_name = params[:first_name]
  	user.last_name  = params[:last_name]
  	user.email      = params[:email]
    user.location   = params[:location]
    user.state      = params[:state]
  	if user.valid?
  		user.save
  		return redirect_to usersShow_path 
  	else
  		flash[:failed] = user.errors.full_messages
  		redirect_to usersEdith_path session[:user_id]
  	end
  end

  def create
  	user = User.new(user_params)
  	session.clear
  	session[:first_name] = params.require(:user).permit(:first_name)[:first_name]
  	session[:last_name]  = params.require(:user).permit(:last_name)[:last_name]
  	session[:email]      = params.require(:user).permit(:email)[:email]
    session[:location]   = params.require(:user).permit(:location)[:location]
    session[:state]      = params.require(:user).permit(:state)[:state]

  	if user.valid?
  		user.save
  		session.clear
  		session[:user_id] = user.id
  		return redirect_to eventsIndex_path
  	else
  		flash[:failed] = user.errors.full_messages
  		return redirect_to sessionsNew_path
  	end
  end

  def destroy
  	User.delete(current_user.id)
  	return redirect_to sessionsDestroy_path
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email,:location, :state, :password, :password_confirmation)
  end

end
