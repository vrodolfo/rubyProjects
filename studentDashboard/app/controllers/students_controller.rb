class StudentsController < ApplicationController
 

  def new
  	@dojo = Dojo.find(params[:dojo_id])
  	@dojos = Dojo.all
  	return render 'new'
  end

  def create

  	@student = Student.new(first_name:params[:first_name], last_name:params['last_name'], email:params['email'], dojo:Dojo.find(params['dojo']))
  	if @student.valid?
  		@student.save
  		session[:first_name] = nil
  		session[:last_name] = nil
  		session[:email] = nil
  		session[:dojo] = nil
  		flash[:success] = "You have Successfully submitted your form!!!"
  		return redirect_to '/dojos/'+params[:dojo]
  	else
  		flash[:failed] = @student.errors.full_messages
  		session[:first_name] = params[:first_name]
  		session[:last_name] = params[:last_name]
  		session[:email] = params[:email]
  		session[:dojo] = params[:dojo]
  		return redirect_to '/dojos/'+params[:id]+'/students/new'
  	end
  end

  def edit
  	@dojo = Dojo.find(params[:dojo_id])
  	@dojos = Dojo.all
  	@student = Student.find(params[:student_id])
  	session[:first_name] = @student.first_name
  	session[:last_name] = @student.last_name
  	session[:email] = @student.email
  	session[:dojo] = @student.dojo
  	return render 'edit'
  end

  def update
  	@dojo = Dojo.find(params[:dojo])
  	@student = Student.find(params[:student_id])
  	@student.first_name = params[:first_name]
  	@student.last_name = params[:last_name]
  	@student.email = params[:email]
  	@student.dojo = @dojo

  	if @student.valid?
  		session[:first_name] = nil
  		session[:last_name] = nil
  		session[:email] = nil
  		session[:dojo] = nil
  		@student.save
  		return redirect_to '/dojos/'+params[:dojo_id]
  	else
  		flash[:failed]   = @dojo.errors.full_messages
  		session[:first_name] = params[:first_name]
  		session[:last_name] = params[:last_name]
  		session[:email]   = params[:email]
  		session[:dojo]  = params[:dojo]
  		return redirect_to '/dojos/'+params[:dojo]+'/students/'+params[:student_id]+'/edit'
  	end
  end

  def show
  	@student = Student.find(params[:student_id])
  	@start_date = @student.created_at.beginning_of_day
  	@end_date   = @student.created_at.end_of_day
  	
  	@students = Student.where(dojo: Dojo.find(params[:dojo_id]), :created_at => @start_date..@end_date)
  	return render 'show'
  end

  def destroy
  	Student.find(params[:student_id]).destroy
  	return redirect_to '/dojos/'+params[:dojo_id]
  end
  
  def goback
  	return redirect_to '/'
  end
end
