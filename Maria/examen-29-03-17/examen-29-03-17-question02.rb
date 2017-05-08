def singlton_class 
	@singlton_class ||= Registration.new
end
require_relative "examen-29-03-17"
class Registration
	include Conversions_module
	attr_accessor :hash_user
	def initialize
		@user_name = nil
		@id = nil
		@hash_user = Hash.new
		@log_file = File.open('logs.txt', 'w+')
		@user_did_not_perform_calc = []
	end
	def add_user_name_info
		#begin
		puts "Enter Id/ The Id should be an integer number"
		@id = gets.chomp

		#end while (@id.to_i == @id)
		begin
		puts "Enter user name"
		@user_name = gets.chomp.to_s

		end while (@user_name.length > 11 || !(@user_name.match(/^[0-9a-z]+$/)))
		@hash_user.store @id,@user_name

		@log_file.write("Inserted  id value: #{@id} and name: #{@user_name}\n")
		
		ask_to_do_calculation(@hash_user)

		
	end
	def add_users
		
		begin
			puts "Enter number of users to register no more than 15 but not less 3"
			number = gets.chomp.to_i
		end while (number > 15 || number < 3)
		(0..number-1).each do |i|
			add_user_name_info
		end
		@log_file.write("enter #{number} number of user to register\n")
		

	end
	def ask_conversion_type
		puts "Enter the conversation type to use"
		puts "a. From mm to cm"
		puts "b. From cm to mt"
		puts "c. From mt to km"

		option = gets.chomp
		@log_file.write("the option #{option} has been selected\n")
		
		#return option
		convert(option)
	end
	def convert(option)
		if (option == 'a')
			puts "Insert the value to mm:"
			mm = gets.chomp.to_f

			@log_file.write("Converting #{mm} mm to cms \n")
			
			convert_mm_to_cm(mm)

		elsif (option == 'b')
			puts "Insert the value to cm:"
			cm = gets.chomp.to_f

			@log_file.write("Converting #{cm} cm to mts \n")
		
			convert_cm_to_mt(cm)

		elsif (option == 'c')
			
			puts "Insert the value to mt:"
			mt = gets.chomp.to_f

			@log_file.write("Converting #{mt} mts to kms \n")
			
			convert_mt_to_km(mt)

		else
			puts "Invalid option"
			@log_file.write("Invalid option to #{option} \n")
		end

	end
	def ask_to_do_calculation(hash)
		puts "Do you want to perform a calculation Yes/No"
		resp = gets.chomp
		if(resp == "yes")
			@log_file.write("The user want to perform a calculation\n")
		
			ask_conversion_type
		else
			puts "Good"
			@user_did_not_perform_calc.push(hash)
			@log_file.write("The user want not to perform a calculation\n")
			
		end
	end
	def print_users_did_not_perform_calculations
		puts "The registered users that do not have any calculations are: #{@user_did_not_perform_calc.inspect}"
		@log_file.write("Print users #{@user_did_not_perform_calc.inspect}\n")
		@log_file.close
	end
end


singlton_class.add_users
singlton_class.print_users_did_not_perform_calculations