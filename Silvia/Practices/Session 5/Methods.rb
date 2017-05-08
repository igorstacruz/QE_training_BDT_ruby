#Methods
def calculate_price_in_Sus(price)
  price_Sus = price / 6.95
  #return price_Sus
end

def print_passenger (name, price, destination="CBBA")
	puts "Name #{name}"
	puts "Destination #{destination}"
	puts "Price #{calculate_price_in_Sus price}"
end

#print_passenger("Silvia", 6.45)

#Ruby block
def test_block
	puts "You are in the method"
	yield
	puts "You are again back to the method"
	yield
end

test_block {puts "You are in the block"}