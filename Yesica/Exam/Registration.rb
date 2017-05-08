=begin
Ruby Files
Yesica Acha	
=end


def singletn_example
	@singletn_example ||= Registration.new
end

require_relative "Converter_module"

class Registration
	include Converter
	attr_reader :users_that_not_perform_calculations

	def initialize
		@user_name
		@user_id
		@user_hash = Hash.new
		@users_that_not_perform_calculations = Array.new
		@logger =  File.open('execution.log', 'w+')
		@logger.truncate(0)
	end	

	def register_user
		puts "Please enter a user name and a user id"
		begin
			print "User name: " 
			@user_name = gets.chomp
		end while !(/^[a-z0-9]{1,11}$/.match(@user_name))

		print "User id: "
		@user_id = gets.chomp
		@user_hash.store @user_id,@user_name	
		@logger.write("INFO: User name: #{@user_name} with id: #{@user_id} was registered\n")
	end

	def ask_amount_of_users
		puts "How many users would you like to register?"
		amount_of_users = gets.chomp.to_i
		if (amount_of_users <= 15 && amount_of_users >= 3 )
			amount_of_users.times {|user| register_user}
			@logger.write("INFO: #{amount_of_users} users were registered\n")
		else 
			puts "The amount of users you want to register is not valid, please try again"		
			@logger.write("ERROR: The amount of users to be registered is incorrect\n")
	        ask_amount_of_users
		end
	end

	def ask_for_convertion_type
		@logger.write("INFO: Ask type of convertion to perform\n")
		puts "Please chose the type of conversion you want"
		puts " a) From millimeters to centimeters"
		puts " b) From centimeters to meters"
		puts " c) From meters to kilometers"

		convertion_type = gets.chomp.to_sym
	end

	def convert_distance
		convertion_type = ask_for_convertion_type

		print "Please enter the value to convert = "
		value = gets.chomp.to_i
		
		if convertion_type == :a
			@logger.write("INFO: Convert from millimeters to centimeters\n")
			puts "#{value} mm represent #{convert_mm_to_cm(value)} cm"
		elsif convertion_type == :b
			@logger.write("INFO: From centimeters to meters\n")
			puts "#{value} cm represent #{convert_cm_to_m(value)} m"
		elsif convertion_type == :c
			@logger.write("INFO: From meters to kilometers\n")
			puts "#{value} m represent #{convert_m_to_km(value)} km"
		else 
			puts "The option you selected is invalid"
			@logger.write("ERROR: Invalid conversion type was selected\n")
		end
	end

	def perform_conversion_by_user(user_name)
		print "Would you like to perform a calculation #{user_name}? "
			perform_calculation = gets.chomp 
			if (perform_calculation =~ /^y(es)?$/i)
				convert_distance
				@logger.write("INFO: Perform convertion for user: #{user_name}\n")
			elsif (perform_calculation =~ /^n(o)?$/i)
				puts "Goob bye #{user_name}"
				@users_that_not_perform_calculations.push(user_name)
			else puts "Your answer is not valid. Please try again"
				@logger.write("ERROR: Invalid answer to perform convertion\n")
				perform_conversion_by_user(user_name)
			end
	end

	def perform_conversion_for_users
		@logger.write("INFO: Iterate users hash to perform convertions for each user\n")
		@user_hash.each {|user_id, user_name| perform_conversion_by_user(user_name)}
	end
end

# Register users
singletn_example.ask_amount_of_users

# Ask for the convertions to perform
singletn_example.perform_conversion_for_users

# Print the list of users that did not perform any calculation
puts "The following users did not perform calculations: "
singletn_example.users_that_not_perform_calculations.each {|user_name| puts user_name}