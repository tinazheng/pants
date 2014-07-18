class PantsController < ApplicationController

	def home
		#leave this blank
	end

	def search
		query = params['query']
		url = "http://api.openweathermap.org/data/2.5/weather?q=#{query}"
		@response = HTTParty.get(url)
		celsius_low = @response['main']['temp_min'] - 273.15
		@f_low = (celsius_low * 9)/5 + 32
		if @f_low < 74
			@message = "PANTS!!"
		else
			@message = "NO PANTS!!"
		end
	end
end