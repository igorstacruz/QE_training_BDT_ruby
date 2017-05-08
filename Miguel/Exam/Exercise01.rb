module Converions
  def Converions.fromMm2Cm millimeters
    return millimeters.to_f/10
  end
  def Converions.fromCm2M centimeters
    return centimeters.to_f/100
  end
  def Converions.fromM2km meters
    return meters.to_f/1000
  end
end


#puts Converions.fromMm2Cm 10
#puts Converions.fromCm2M 100
#puts Converions.fromM2km 1000
