=begin
  Exercise 01 related to Module
=end

module Conversions
	def milimeters_to_centimeters(distance)
		centimeters = distance * 0.1
	end

	def centimeters_to_meters(distance)
		meters = distance / 100
	end

	def meters_to_kilometers(distance)
		kilometers = distance / 1000
	end
end

class ConversionSample
	include Conversions
end

puts "=======> CONVERSIONS"
conversion = ConversionSample.new

milimeters = 15
puts "Converts #{milimeters} milimeters to centimeters: #{conversion.milimeters_to_centimeters(milimeters)} cm"

centimeters = 100
puts "Converts #{centimeters} centimeters to meters: #{conversion.centimeters_to_meters(centimeters)} m"

meters = 1000
puts "Converts #{meters} meters to kilometers: #{conversion.meters_to_kilometers(meters)} km"