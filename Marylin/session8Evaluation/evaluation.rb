module Conversions
	def Conversions.convert_millimeters_to_centimeters(millimeters)
		millimeters/10
	end
	def Conversions.convert_centimeters_to_meters(centimeters)
		centimeters/100
	end
	def Conversions.convert_meters_to_kilometers(meters)
		meters/1000
	end
end

class Registration
	include Conversions
	def initialize()
		puts "Initialize all values null/empty"
    	@user_name = ""
    	@user_id = ""
    	@quantity = 0
    	@registration_list = Hash.new
    end

    def add_user
    	while !((/[a-z]{11}/).match(@user_name))
    		puts "Type a user name: "
    		@user_name = gets.chomp.to_s
    	end
    	puts "Type the user id: "
    	@user_id= gets.chomp.to_s
    	@registration_list[@user_id] = @user_name

    	@user_name
    end
    def request_quantity    	
    	while @quantity < 3 or @quantity > 15
    		puts "Type the users quantity: "
    		@quantity = gets.chomp.to_i    		
    	end
    	@quantity
    end
end

def select_convertion_option
	puts "Convertion Options"
	puts "a) From millimeters to centimeters"
	puts "b) From centimeters to meters"
	puts "c) From meters to kilometers"

	option_selected = gets.chomp.to_s
end

#use to_f if you convert unexact values
def converts(option)
	if option == "a"
		puts "Insert the value in mm :"
		millimeters = gets.chomp.to_i
		centimeters = Conversions.convert_millimeters_to_centimeters millimeters
		puts "#{millimeters} mm represent #{centimeters} cm"
	elsif option == "b"
		puts "Insert the value in cm :"
		centimeters = gets.chomp.to_i
		meters = Conversions.convert_centimeters_to_meters centimeters
		puts "#{centimeters} cm represent #{meters} mt"
	elsif option == "c"
		puts "Insert the value in mt :"
		meters = gets.chomp.to_i
		kilometers = Conversions.convert_meters_to_kilometers meters
		puts "#{meters} mt represent #{kilometers} km"
	else
		puts "Unsupported option"
	end

end

def main_method
	logger_write "[INFO] create registration instance"
	registration = Registration.new
	logger_write "[INFO] Request quantity of users"
	total_users = registration.request_quantity
	user_not_perform = Array.new
	while total_users > 0
		logger_write "[INFO] Register a user"
		user_name = registration.add_user
		total_users -= 1
		logger_write "[INFO] Ask user to perform a calculation"
		puts "Do you want to perfom a calculation?"
		c_option = gets.chomp.to_s
		if c_option == "Yes"
			logger_write "[INFO] Perform a calculation"
			convert_option = select_convertion_option
			converts(convert_option)
		else
			logger_write "[INFO] User is not going to perform a calculation, so say good by to user"
			puts "Good Bye!!!"
			user_not_perform.push(user_name)
		end
	end
	logger_write "[INFO] Return the list of users that does not perform a calculation"
	user_not_perform
end

def logger_write(line)
	log_file_name = "execution.log"
	file_example = File.open(log_file_name,'a+')
	file_example.puts(line)
	file_example.close
end

#logger_write "[INFO] Print users array that didn't perform the calculation"
puts main_method
#puts main_method.inspect

=begin
registration = Registration.new
total_users = registration.request_quantity
while total_users > 0
	registration.add_user
	total_users -= 1
end

convert_option = select_convertion_option
converts(convert_option)
=end

#registration = Registration.new
#registration.add_user