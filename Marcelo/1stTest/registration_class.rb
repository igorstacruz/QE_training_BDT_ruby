=begin
Ruby Singleton
=end

require './modules/distance_convertions'
require './modules/logger'

def singletn_example
	@singletn_example ||= RegistrationClass.new
end
class RegistrationClass
	attr_accessor :user, :id, :users, :users_no

	def initialize
		@user = nil
		@id = nil
		@users = Hash.new
		@users_no = Array.new
	end
	def ask_username
		puts "Please enter the user NAME (no more than 11 characters in lowercase and/or numbers):"
		username = gets.chomp.to_s
		case username
		when /^[a-z0-9]{1,11}$/; 
			Logger.data_inserted "Submitted username", username
			username
		else; 
			ask_username
		end
	end
	def ask_id
		puts "Please enter the user ID (Just a number):"
		number = gets.chomp.to_i
		if number > 0
			Logger.data_inserted "Submitted ID", number
			number
		else; 
			ask_id
		end
	end
	def ask_number_of_users
		puts "Please enter the amount of users (no more than 15 but not less than 3):"
		number = gets.chomp.to_s
		case number
		when /^([1-9][0-5]|[3-9])$/; 
			Logger.data_inserted "Amount of users", number
			number.to_i 
		else; 
			ask_number_of_users
		end
	end
	def register_user username, id
		@users.store(username, id)
	end
	def ask_convertion
		show_convertions
		puts "Select one of the convertions (just the letter):"
		selected = gets.chomp.to_s
		case selected
		when /^[a-c]$/; 
			Logger.data_inserted "Selected convertion", selected
			calcuation_result selected
			selected
		else; 
			ask_convertion
		end
	end
	def show_convertions
		DistanceConvertions.show_convertions
	end
	def register_users number_of_users
		counter = 0
		while counter < number_of_users do
			register_user ask_username, ask_id
			counter += 1
		end
	end
	def calcuation_result option
		case option
		when "a"; puts "Insert the value in mm:"
		when "b"; puts "Insert the value in cm:"
		else; puts "Insert the value in m:"
		end

		number = gets.chomp.to_i
		if number > 0
			Logger.data_inserted "Submitted ID", number
			number
		else; 
			ask_id
		end

		case option
		when "a"; 
			DistanceConvertions.from_milimeters_to_centimeters number
		when "b"; DistanceConvertions.from_centimeters_to_meters number
		else; DistanceConvertions.from_meters_to_kilometers number
		end
	end
	def ask_to_perform_calculation
		@users.each do |key, value|
			puts "User '#{key}' do you want to perform a calculation?(Y/N)"
			option = ask_calculation_option
			case option
			when "y"; 
				ask_convertion
			else; 
				@users_no.push(key)
				Logger.data_returned "user #{key}", "does not want a calculation" 
				puts "Good bye"
			end
		end
	end
	def ask_calculation_option
		option = gets.chomp.to_s
		case option
		when /^([yY]|[nN]){1,1}$/; 
			Logger.data_inserted "Submitted calculation option", option
			option.downcase
		else; 
			ask_calculation_option
		end
	end
	def print_users_no
		print "User that said NO to calculation: "
		Logger.data_returned "User that said NO to calculation", @users_no 
		p @users_no
		exit
	end
end

number_of_users = singletn_example.ask_number_of_users
singletn_example.register_users number_of_users
singletn_example.ask_to_perform_calculation
singletn_example.print_users_no
