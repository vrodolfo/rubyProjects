class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
  	session.clear
  	user = User.find_by(email:params[:email])
  	session[:email2] = params[:email]
  	if user
  		if user.try(:authenticate, params[:password])
  			session.clear
  			session[:user_id] = user.id
  			flash[:success] = ["success"]
  			return redirect_to eventsIndex_path
  		else
  			flash[:failed] = ["Invalid Password"]
  		end
  	else
  		flash[:failed] = ["Invalid Email"]
  	end
  	return redirect_to :back #sessionsNew_path
  end

  def destroy
  	if session.key? 'user_id'
  		session.delete(:user_id)
  	end
  	return redirect_to sessionsNew_path
  end
end
