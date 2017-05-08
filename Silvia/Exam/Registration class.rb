require_relative "Convert distances.rb"
require_relative "Log.rb"

class Registration
	attr_accessor :user_name
	attr_accessor :user_id
	attr_accessor :users_amount

	def initialize 
		Logger.log ("Initialize Registration")

		@user_name = nil
		@user_id = nil
		@users_amount = 0
		@hash = {}
	end

	def set_user_info
		#Set the user information
		Logger.log ("Set user information")

		@user_name = ""
		while !(/^[a-z0-9]{1,11}$/.match(@user_name)) do
			puts "Introduce the user name"
			@user_name = gets.chomp
			Logger.log ("User name introduced: #{@user_name}")
		end

		#Get the user ID
		puts "Introduce the user ID"
		@user_id = gets.chomp
		Logger.log ("User id introduced: #{@user_id}")

		#Add to hash
		@hash [@user_id] = @user_name
	end

	def set_users_amount
		#Get the amount of users
		Logger.log ("Get the amount of users")

		while (@users_amount < 3) || (@users_amount > 15) do
			puts "Introduce the amount of users"
			@users_amount = gets.chomp.to_i
			Logger.log ("Amount of users introduced: #{@users_amount}")
		end

		#Ask to set the user information for the amount of users
		@users_amount.times do
			set_user_info
		end
	end

	def select_conversion_type
		#Select the conversion type for all the users
		Logger.log ("Select the conversion type")

		puts "Which type of conversion do you want?"
		puts "a) From Millimeters to Centimeters"
		puts "b) From Centimeters to Meters"
		puts "c) From Meters to Kilometers"
		gets.chomp
	end

	def calculate
		#Calculate the converted value
		Logger.log("Calculate the converted value")

		conversion_type = select_conversion_type
		Logger.log("Conversion type selected #{conversion_type}")		

		if conversion_type == "a"
			puts "Insert the value in mm:"
			value = gets.chomp.to_i
			value_converted = Distance_Conversions.convert_mm_to_cm(value)
			puts "#{value} mm represent #{value_converted} cm"
			Logger.log ("#{value} mm represent #{value_converted} cm")

		elsif conversion_type == "b"
			puts "Insert the value in cm:"
			value = gets.chomp.to_i
			value_converted = Distance_Conversions.convert_cm_to_m(value)
			puts "#{value} cm represent #{value_converted} m"
			Logger.log ("#{value} cm represent #{value_converted} m")

		elsif conversion_type == "c"
			puts "Insert the value in m:"
			value = gets.chomp.to_i
			value_converted = Distance_Conversions.convert_m_to_km(value)
			puts "#{value} m represent #{value_converted} km"
			Logger.log ("#{value} m represent #{value_converted} km")
		end
	end

	def ask_for_calculation
		#Ask for calculation
		Logger.log ("Ask for calculation for all the users")

		users_list = Array.new
		@hash.each do |id, name|
			puts "Do you want to perform the calculation #{name}? (YES/NO)"
			response = gets.chomp
			if response == "YES"
				Logger.log "User #{name} wants to perform the calculation"
				select_conversion_type

			elsif response == "NO"
				puts "Good by #{name}"
				users_list.push (name)
				Logger.log ("User #{name} added to the list of users that do not perform any calculation")
			end
		end
		return users_list
	end

	def print_users_list_no_calculation
		users_list = ask_for_calculation
		puts "Users that do not perform any calculation are #{users_list.inspect}"
		Logger.log ("Users that do not perform any calculation are #{users_list.inspect}")
	end

end

def registration_singleton
	@registration_singleton ||= Registration.new
end

Logger.initialize
registration_singleton.set_users_amount
#registration_singleton.select_conversion_type
#registration_singleton.calculate
#registration_singleton.ask_for_calculation
registration_singleton.print_users_list_no_calculation