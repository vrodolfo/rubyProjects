class SessionsController < ApplicationController
  skip_before_action :check_user, except: [:destroy]

  def new
  	return render 'new'
  end

  def log_in
    # Log User In
    # if authenticate true
    # @user = User.find_by_email(params[:Email]).try(:authenticate, params[:Password])
    # if @user
    # 	session[:user_id] = @user.id
    # 	return redirect_to secretsIndex_path
    # else
    # 	flash[:failed] = ["Invalid Combination"]
    # 	return redirect_to sessionNew_path
    # end

    @user = User.find_by_email(params[:Email])
    if @user
      if @user.try(:authenticate, params[:Password])
        session[:user_id] = @user.id
        return redirect_to secretsIndex_path
      else
        flash[:failed] = ["Invalid Password"]
      end
    else
      flash[:failed] = ["Invalid Email"]
    end

    return redirect_to sessionNew_path

  end
  helper_method :log_in
  
  def destroy
    # Log User out
    if session[:user_id]
      session[:user_id] = nil
    end

    #if 'user_id' in session 
    return redirect_to sessionNew_path
  end

end
