=begin
Exam Module - Dista
Yesica Acha	
=end

module Converter

	# Convert distance from millimiters to centimiters

	def convert_mm_to_cm distance_in_mm
		distance_in_cm = distance_in_mm / 10
	end

	def convert_cm_to_m distance_in_cm
		distance_in_m = distance_in_cm / 100
	end

	def convert_m_to_km distance_in_m
		distance_in_km = distance_in_m / 1000
	end
end