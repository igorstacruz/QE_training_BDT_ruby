require 'singleton'  
 class Registration  
    include Singleton
    attr_reader :user_name
    attr_reader :id
    attr_reader :users  	  
 	def initialize
 		 @file_log = File.open("execution.log", 'a+')
         @user_name= nil
         @id = nil
         @users = {}
 	end

 	def ask_for_user_info  amount_users
 		(1..amount_users).each do |n|
	      puts "Please insert the #{n}th ID:"
	      @file_log.write("Please insert the #{n}th ID:") 
    	  @id = gets.chomp
    	  @file_log.write(@id) 
    	  puts "Please insert the #{n}th user Name:"
    	  @file_log.write("Please insert the #{n}th user Name:")  
    	  @user_name = self.validate_user_name
    	  @users.store(@id, @user_name)
    	end  
    end

  	def validate_user_name 
   	  begin
        puts "Please insert a valid user Name, Only lowercase and numbers (no more than 11 characters):"
        @file_log.write("Please insert a valid user Name, Only lowercase and numbers (no more than 11 characters):") 
        name = gets.chomp
        @file_log.write(name)
        valid = /^[a-z0-9]{1,11}$/.match(name)
   	  end while !valid
  	  return name
  	end

 	def ask_user_amount
 		begin
   		  puts "number of users to register, no more than 15 but no less of 3:"
   		  @file_log.write("number of users to register, no more than 15 but no less of 3:") 
   		  size = gets.chomp.to_i
   		  @file_log.write(size.to_s)
  		end while (size < 3 || size > 15)
  		return size
	end

	def type_conversion
		begin
		  puts "Wich type of conversion you want, if no valid you will be pront again:"
		  @file_log.write("Wich type of conversion you want, if no valid you will be pront again:")
		  puts "a) From milimeters to centimeters"
		  @file_log.write("a) From milimeters to centimeters")
		  puts "b) From centimeters to meters"
		  @file_log.write("b) From centimeters to meters")
		  puts "c) From meters to Km"
		  @file_log.write("c) From meters to Km")
		  option = gets.chomp
		  @file_log.write(option)
		  valid = /^[a,b,c]{1}$/.match(option)
		end while !valid
		puts "option selected by user: #{option}"
		@file_log.write("option selected by user: #{option}")
  		return option
	end

	def conversion_calc option
		case option 
   		when "a"
   		  	puts "Insert the value in milimeters:"
   		  	mm = gets.chomp.to_f
   		  	puts "#{mm} milimeters represent #{mm/10}cm"
   		 when "b"
   		  	puts "Insert the value in cm:"
   		  	cm = gets.chomp.to_f
   		  	puts "#{cm} cm represent #{cm/100}mt"
   		when "c"
   		  	puts "Insert the value in meters:"
   		  	meters = gets.chomp.to_f
   		  	puts "#{meters} meters represent #{meters/1000}Km"
        end
	end

	def pront_users_for_conversion
		array_no = []
		@users.values.each do |user_name|
		  puts "#{user_name}, do you want to perform a calculation? YES/NO"
		  calculation = gets.chomp
      	  if calculation == "YES" || calculation == "yes"
      	  	puts "you select yes/YES"
      	  	self.conversion_calc(self.type_conversion)
      	  else
      	    puts "you select NO/no or an invalid input"
      	    puts "good bye #{user_name}"
      	    array_no.push(user_name)	
      	  end
        end
        return array_no
   end

 	def print_array array
 		puts "list user no perform calculation:"
        p array
 	end
 end 

file_log = File.open("execution.log", 'a+')
puts "Need to Insert valid values, if not you will pront again"
file_log.write("Need to Insert valid values, if not you will pront again")
exam = Registration.instance
exam.ask_for_user_info(exam.ask_user_amount)
puts "using getters to get users information"
file_log.write("using getters to get users information")
puts "last user name inserted: #{exam.user_name}"
file_log.write("last user name inserted: #{exam.user_name}")
puts "last user id inserted: #{exam.id}"
file_log.write("last user id inserted: #{exam.id}")
puts "list of  users and ids:"
file_log.write("list of  users and ids:")
p exam.users
file_log.write(exam.users.to_s)

other = Registration.instance
puts "list of users are not lose since we are using singlenton"
file_log.write("list of users are not lose since we are using singlenton")
p other.users

list_user_no = other.pront_users_for_conversion
other.print_array(list_user_no)
