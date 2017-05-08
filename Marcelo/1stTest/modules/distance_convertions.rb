=begin
Ruby variables
=end
# Module defined in distance_convertions.rb file

# require 'logger'

module DistanceConvertions
	
	def DistanceConvertions.from_milimeters_to_centimeters value
		puts "from_milimeters_to_centimeters"
		Logger.data_returned "#{value} mm from_milimeters_to_centimeters", "#{(value / 10)} cm"
		p "#{value} mm represent #{(value / 10)} cm"
	end
	def DistanceConvertions.from_centimeters_to_meters value
		puts "from_centimeters_to_meters"
		Logger.data_returned "#{value} cm from_centimeters_to_meters", "#{(value / 10)} m"
		p "#{value} cm represent #{(value / 100)} m"
	end
	def DistanceConvertions.from_meters_to_kilometers value
		puts "from_meters_to_kilometers"
		Logger.data_returned "#{value} m from_meters_to_kilometers", "#{(value / 10)} km"
		p "#{value} m represent #{(value / 1000)} km"
	end
	def DistanceConvertions.show_convertions
		puts "LIST OF CONVERTIONS\n============="
		puts "a) from_milimeters_to_centimeters"
		puts "b) from_centimeters_to_meters"
		puts "c) from_meters_to_kilometers"
	end
end