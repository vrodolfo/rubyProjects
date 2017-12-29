class RpgController < ApplicationController
 
  def index

  	session[:gold]     ||= 0
  	session[:activities] ||= []

  	return render 'index'
  end

  def farm
  	gold = rand(10..20)
  	session[:gold] += gold
  	activity = "Earned: " + gold.to_s + " Golds from the Farm! (" + Time.now.strftime("%H:%M:%S") +")"
  	session[:activities].push({:activity => activity, :color => 'green'})
  	return redirect_to '/'
  end

  def cave
  	gold = rand(5..10)
  	session[:gold] += gold
  	activity = "Earned: " + gold.to_s + " Golds from the Cave! (" + Time.now.strftime("%H:%M:%S") +")"
  	session[:activities].push({:activity => activity, :color => 'green'})
  	return redirect_to '/'
  end

  def casino
  	gold = rand(-50..50)
  	session[:gold] = gold

  	if gold >= 0
		activity = "Earned: " + gold.to_s + " Golds from the casino! (" + Time.now.strftime("%H:%M:%S") +")"
		color = "green"
	else
		activity = "Enter a Casino  and Lost: " +  gold.to_s + " ..Ouch... "  + " (" + Time.now.strftime("%H:%M:%S") +")"
		color = "red"
	end

	session[:activities].push({:activity => activity, :color => color})

  	if session[:gold] < 0
  		session[:gold] = 0
  	end
  	return redirect_to '/'
  end

  def house
  	gold = rand(2..5)
  	session[:gold] += gold
  	activity = "Earned: " + gold.to_s + " Golds from the House! (" + Time.now.strftime("%H:%M:%S") +")"
  	session[:activities].push({:activity => activity, :color => 'green'})
  	return redirect_to '/'
  end

  def reset
  	session[:gold] = nil
  	session[:activities] = nil
  	return redirect_to '/'
  end
end
