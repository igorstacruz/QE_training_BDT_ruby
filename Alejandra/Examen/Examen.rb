$file_name = "execution.txt"
$log = File.open($file_name, "a+")
$log.truncate (0)

module Module1
	def milimeters_centimeters milimeters
	 	milimeters/10.0
	end 

	def centimeters_meters centimeters
	 	centimeters/100.0
	end 

	def meters_kilometers meters
	 	meters/1000.0
	end
end

def reg_instance 
	@reg_instance ||= Registration_Users.new 
end

class Registration_Users
	include Module1
	attr_accessor :hash_users

	def initialize
		@hash_users = {}
		@username = nil
		@id = nil
	end

	def get_user
		begin
			puts "Get username: "
			@username = gets.chomp
			$log.write("entry: #{@username}\n")
		end while !(/^[a-z0-9]{0,11}$/ =~ @username)

		puts "Get ID: "
		@id = gets.chomp.to_i
		$log.write("entry: #{@id}\n")
		@hash_users.store(@id, @username)
	end

	def get_number_of_users
		begin
			puts "Get a number of users: "
			users_number = gets.chomp.to_i
			$log.write("entry: #{users_number}\n")
		end while !(users_number >= 3 and users_number <=15) 
		users_number
	end


	def ask_for_conversation_type
		puts "Select one type of conversation: "
		puts "a.) From milimeters_centimeters "
		puts "b.) From centimeters_meters"
		puts "c.) From meters_kilometers"
		return type = gets.chomp
		$log.write("entry: #{type}\n")
	end

	def conversion t
		if t == "a"
			puts "Insert the value in ml: "
			ml = gets.chomp.to_f
			puts "#{ml} ml represent #{milimeters_centimeters ml} cms"
		elsif t == "b"
			puts "Insert the value in cm: "
			cm = gets.chomp.to_f
			puts "#{cm} cms represent #{centimeters_meters cm} mts"
		elsif t == "c"
			puts "Insert the value in mt: "
			mt = gets.chomp.to_f
			puts "#{mt} mts represent #{meters_kilometers mt} kms"
		end
	end

	def calculation_users
		users_do_calculation = Array.new
		@hash_users.each {|id, name|
			puts "Do you want to perform some calculation: "
			puts "Yes"
		    puts "No"
			option = gets.chomp
			if option == "Yes" 
			 	conversion(ask_for_conversation_type) 
			 	users_do_calculation.push(name)
			else 
				puts "Good bye"
			end
		}
		users_do_calculation
	end

end

number_users = reg_instance.get_number_of_users
number_users.times do reg_instance.get_user end
p reg_instance.hash_users
puts reg_instance.calculation_users

$log.close
$log = File.open($file_name)
print "Logs:\n" + $log.read
