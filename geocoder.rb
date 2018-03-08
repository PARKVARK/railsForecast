require 'geocoder'

puts "장소를 입력하시오"
location = gets.chomp
loCord = Geocoder.coordinates location
puts loCord
#장소 입력하기
