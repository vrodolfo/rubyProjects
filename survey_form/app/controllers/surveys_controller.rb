class SurveysController < ApplicationController
  def index
  	return render 'index'
  end

  def create
  	#Data from the form 
  	@name     = params[:name]
  	@location = params[:location]
  	@language = params[:language]
  	@comment  = params[:comment]

  	session[:name]     = @name
  	session[:location] = @location
  	session[:language] = @language
  	session[:comment]  = @comment

  	flash[:success] = "You have Successfully submitted your form!!!"

  	#session
  	return redirect_to '/surveys/result'
  end

  def result
  	return render 'result'
  end

  def goback
  	session[:name]     = nil
  	session[:location] = nil
  	session[:language] = nil
  	session[:comment]  = nil
  	return redirect_to '/surveys/create'
  end
end
