#Util to convert distances
module Distance_Conversions
	def Distance_Conversions.convert_mm_to_cm (mm)
		mm/10.0
	end
	def Distance_Conversions.convert_cm_to_m (cm)
		cm/100.0
	end

	def Distance_Conversions.convert_m_to_km (m)
		m/1000.0
	end
end

#puts Distance_Conversions.convert_mm_to_cm(20)
#puts Distance_Conversions.convert_cm_to_m(300)
#puts Distance_Conversions.convert_m_to_km(400)