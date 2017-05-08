=begin
Considered your previous script of convert seconds in minutes 
and seconds in hours :
Ask from prompt the value of the seconds
Perform the calculation of minutes and hours into one function, 
return both values
Print the values of the variables.
=end

def convert(seconds)
  minutes = seconds/60
  hours = minutes/60
  return minutes, hours
end

puts "Type the seconds to convert: "
seconds = gets.chomp.to_i

minutes, hours = convert(seconds)

puts "Minutes: #{minutes}"
puts "Hours: #{hours}"