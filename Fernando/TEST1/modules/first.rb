module DistanceConvertion
	def DistanceConvertion.millimetersToCentimeters(millimeters)
	    return (millimeters/10).to_f
	end

	def DistanceConvertion.centimeterToMeters(centimeters)
		return (centimeters/100).to_f
	end
   
    def DistanceConvertion.metersToKilometers(meters)
    	return (meters/1000).to_f
    end
end
