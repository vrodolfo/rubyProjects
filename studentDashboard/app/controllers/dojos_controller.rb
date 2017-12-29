class DojosController < ApplicationController
  def index
  	@total = Dojo.count
  	@dojo = Dojo.all
  	return render 'index'
  end

  def new
  	return render 'new'
  end

  def create

  	@dojo = Dojo.new(branch:params[:branch], street:params['street'], city:params['city'], state:params['state'])
  	if @dojo.valid?
  		@dojo.save
  		session[:branch] = nil
  		session[:street] = nil
  		session[:city] = nil
  		session[:state] = nil
  		flash[:success] = "You have Successfully submitted your form!!!"
  		return redirect_to '/'
  	else
  		flash[:failed] = @dojo.errors.full_messages
  		session[:branch] = params[:branch]
  		session[:street] = params[:street]
  		session[:city] = params[:city]
  		session[:state] = params[:state]
  		return redirect_to '/dojos/new'
  	end
  end

  def edit
  	@dojo = Dojo.find(params[:id])
  	session[:branch] = @dojo.id
  	session[:branch] = @dojo.branch
  	session[:street] = @dojo.street
  	session[:city] = @dojo.city
  	session[:state] = @dojo.state
  	return render 'edit'
  end

  def update
  	@dojo = Dojo.find(params[:id])
  	@dojo.branch = params[:branch]
  	@dojo.street = params[:street]
  	@dojo.city = params[:city]
  	@dojo.state = params[:state]

  	if @dojo.valid?
  		session[:branch] = nil
  		session[:street] = nil
  		session[:city] = nil
  		session[:state] = nil
  		@dojo.save
  		return redirect_to '/'
  	else
  		flash[:failed] = @dojo.errors.full_messages
  		session[:branch] = params[:branch]
  		session[:street] = params[:street]
  		session[:city] = params[:city]
  		session[:state] = params[:state]
  		return redirect_to '/dojos/'+@dojo.id+'/edit'
  	end
  end

  def show
  	@dojo = Dojo.find(params[:id])
    @students = Student.where(dojo: params[:id])
  	return render 'show'
  end

  def destroy
  	Dojo.find(params[:id]).destroy
  	return redirect_to '/'
  end
  
  def goback
  	return redirect_to '/'
  end
end
