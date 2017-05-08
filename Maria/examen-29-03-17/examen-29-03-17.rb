module Conversions_module
	def convert_mm_to_cm(milimeters)
		cm = milimeters / 10
		puts "#{milimeters} mm represents #{cm} cms"
	end

	def convert_cm_to_mt(centimeters)
		mtrs = centimeters / 100
		puts "#{centimeters} cm represents #{mtrs} mtrs"
	end

	def convert_mt_to_km(meters)
		km = meters / 1000
		puts "#{meters} mtrs represents #{km} km"
	end
end

class Conversion
	include Conversions_module
end
#p = Conversion.new
#p.convert_mm_to_cm(100)
#p.convert_cm_to_mt(1000)
#p.convert_mt_to_km(1000)
