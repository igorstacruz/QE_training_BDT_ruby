=begin
Write 1 method that prints a passenger name ,a destination city and the price of ticket in dollars.
The name should be received from the user
If no destination is defined the value by default should be CBBA.
The price of the ticket should be received by user, and the transformation to dollars should be returned from the method. It should be  float (E.g 150.25)
Perform the calculation using variables, to return the value don’t use return word
When you call the method, don’t use parenthesis
After call the method don’t forget to print the value returned.
=end
def buy_ticket(passenger_name,ticket_price,destination_city="CBBA")
  dollars_ticket_price = ticket_price * 7
  puts "#{passenger_name}: "
  puts "your ticket price to #{destination_city} is #{dollars_ticket_price} $"
   dollars_ticket_price
end

puts "Type the user name: "
passenger_name = gets.chomp.to_s

puts "Type the destination city: "
destination_city = gets.chomp.to_s

puts "Type the ticket price(Bs): "
ticket_price = gets.chomp.to_f

# With destination city
dollars_ticket_price = buy_ticket passenger_name, ticket_price, destination_city
puts "Returned ticket price: #{dollars_ticket_price}"

# Without destination city
dollars_ticket_price = buy_ticket passenger_name, ticket_price
puts "Returned ticket price: #{dollars_ticket_price}"
