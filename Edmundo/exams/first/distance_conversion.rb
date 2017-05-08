module DistanceConversion
  def milli_centi(milli)
    "#{milli} millimetes represent #{milli/10.0} centimeters"
  end

  def centi_meters(centi)
    "#{centi} centimeters represent #{centi/100.0} meters"
  end

  def meters_km(meters)
    "#{meters} meters represent #{meters/1000} km"
  end
end