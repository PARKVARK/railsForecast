#만들어보기
require 'forecast_io' 
require 'geocoder'
require 'pry'


puts "위치를 입력하시오"
location = gets.chomp
loCord = Geocoder.coordinates location #위도와 경도를 배열로 받아옴
puts "위도 #{loCord.first}"
puts "경도 #{loCord.last}"


SECRET_KEY = '742098cf08f95a6c91f89c078bbdd1ab' #대문자로 쓰면 상수화 할수 있다.

ForecastIO.configure do |configuration|
  configuration.api_key = SECRET_KEY
end
#ForecastIO.api_key = 'this-is-your-api-key'

forecast = ForecastIO.forecast(loCord.first, loCord.last)
c = forecast.currently  
cel_c = ((c.apparentTemperature-32)*5/9).round 2


#섭씨 화씨 변환기
def convert_temp(temp, to)
    if to == 'c'
        ((temp -32 ) *5/9).round 2
    elsif to == 'f'                #루비에선 else if 가 아니라 elsif로 사용
        ((temp *1.8) +32).round 2
    end
end


puts "#{location}의 날씨는 현재 #{c.summary}입니다. 온도는 섭씨 #{cel_c} 도 입니다"

puts "화씨로는 #{convert_temp(cel_c, 'f')} 입니다"