=begin
  Exercise 02 applying methods, hash, array and other thins see in class.
=end
class Registration
	attr_accessor :hash

	def initialize
		@hash = {}
	end

	def ask_to_user
		puts "Please entered the username:"
		username = gets.chomp
		puts "Please entered the ID:"
		userid = gets.chomp

		validate(username, userid)
	end

	def validate(username, userid)
		#accept: jhasmany, jhasmanyqui, jhasmany123, 123456789 (only numbers)
		#no accept: jhasmanyasdfgh, jhasWERdss, JHASMANY, etc.
		pattern = /(^[a-z]{1,11}|\d{1.11}$)|(^[\d]{1,11}$)/

		if pattern =~ username
			if !@hash.has_key?(username)
				@hash[username] = userid
			end
		else
			puts "Please entered the username in lower case and only 11 characters/numbers"	
		end
	end

	def user_numbers
		size = 1
		
		while size <= 3
			ask_to_user
			size += 1
		end
	end

	def type_conversion
		puts "Please select a option:"
		puts "a) From Milimeters to Centimeters"
		puts "b) From Centimeters to Meters"
		puts "c) From Meters to Kilometers"
		option = gets.chomp
		message = "The option entered is: #{option}"
		save(message)
		calculate_conversion option
	end

	def calculate_conversion(option)
		case option
			when /^A|a/
				milimeters_to_centimeters
			when /^B|b/
				centimeters_to_meters
			when /^C|c/
				meters_to_kilometers
			else
				message = "The option entered is wrong!!!"
				save(message)
				puts message
		end
	end

	def milimeters_to_centimeters
		message = "Please entered the value in mm for converts to cm"
		puts message
		save(message)
		distance = gets.chomp.to_f
		centimeters = distance * 0.1
		message = "#{distance} mm represents #{centimeters} cm"
		puts message
		save(message)
	end

	def centimeters_to_meters
		message = "Please entered the value in cm for converts to m"
		puts message
		save(message)
		distance = gets.chomp.to_f
		meters = distance / 100
		message = "#{distance} cm represents #{meters} m"
		puts message
		save(message)
	end

	def meters_to_kilometers
		message = "Please entered the value in m for converts to km"
		puts message
		save(message)
		distance = gets.chomp.to_f
		kilometers = distance / 1000
		message = "#{distance} m represents #{kilometers} km"
		puts message
		save(message)
	end

	def iterate_hash
		users = []
		@hash.each do |username, id|
			message = "#{username} do you want execute an operation?"
			puts message
			answer = gets.chomp

			case answer
				when /YES|yes|y/
					type_conversion
				when /NO|no|n/
					message = "Goob bye #{username}"
					puts message
					users.push username
			end
		end

		message = "The users that was execute operations: #{users}"
		save(message)
		return users
	end

	def print_users_not_excuted_operation(users)
		users.each do |name|
			message = "#{name} don't was execute none operation"
			puts message
			save(message)
		end
	end

	def save(text)
		file = File.open('execution.txt', 'a+')
		file.write(text)
		file.close
	end
end

def registration
	@registration ||= Registration.new
end

registration.user_numbers
puts "The next users was registered:"
p registration.hash

users = registration.iterate_hash
puts "The users:"
registration.print_users_not_excuted_operation users