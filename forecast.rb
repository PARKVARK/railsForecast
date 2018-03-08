require 'pry'
require 'forecast_io' 

SECRET_KEY = '742098cf08f95a6c91f89c078bbdd1ab' #대문자로 쓰면 상수화 할수 있다.

ForecastIO.configure do |configuration|
  configuration.api_key = SECRET_KEY
end
#ForecastIO.api_key = 'this-is-your-api-key'

forecast = ForecastIO.forecast(37.8267, -122.423)
c = forecast.currently  

puts "#{c.summary} & #{c.apparentTemperature}"

binding.pry

puts 'END'