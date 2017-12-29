class UsersController < ApplicationController
  skip_before_action :check_user, except: [:destroy, :show, :edit, :update, :destroy]

  before_action :check_user_autho
  def check_user_autho
    if session[:user_id].to_s != params[:user_id].to_s
      return redirect_to userShow_path session[:user_id]
    end
  end

  def new
  	return render 'new'
  end


  def create
    @user = User.new(name:params[:Name], email:params[:Email], password:params[:Password], password_confirmation:params[:Password_Confirmation])
    if @user.valid?
      @user.save
      return redirect_to sessionNew_path
    else
      flash[:failed] = @user.errors.full_messages
      return redirect_to userNew_path   
    end
  end


  def show
    @secrets = Secret.where(user:current_user)
  	return render 'show'
  end


  def edit
    return render 'edit'
  end

  def update
    @user = User.find(current_user.id)
    @user.name = params[:Name]
    @user.email = params[:Email]
    if @user.valid?
      @user.save
      return redirect_to secretsIndex_path
    else
      flash[:failed] = @user.errors.full_messages
      return redirect_to userEdit_path @user.id
    end
  end

  def destroy
    User.find(current_user.id).delete
    session[:user_id] = nil
    return redirect_to userNew_path
  end

end
