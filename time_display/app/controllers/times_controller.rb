class TimesController < ApplicationController
  def main

  	@time = Time.now.strftime("%H:%M:%S")
  	@date = Date.today.to_s
  	return render 'main'
  end
end
