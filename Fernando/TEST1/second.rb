require "singleton"
require_relative "modules/first.rb"

class Registration
	include Singleton
	include DistanceConvertion

    attr_accessor :credentials

    def initialize
    	@credentials = Hash[]
    	@name = ""
    	@u_id = ""
    	@users_with_no_calculation = []
        @log_file = File.new("execution.log", "w")
    end

	def insertCredentials
        @log_file.puts("Calling method insert credentials")
		while true 
		  puts("Please insert your ID")
    	  @u_id = gets.chomp
          @log_file.puts("id: #{@u_id} was inserted")

	      puts("Please insert your username")
		  @name = gets.chomp 
          @log_file.puts("name: #{@name} was inserted")
			if (@name =~ /(^([a-z]|[0-9]){,11}$)/)
				break
			else 
				puts("Your name should contains lowercase and or numbers")
				puts("And also no more than 11 characters")
			end
		  
		end
       credentials[@name] = @u_id
       askUserRegister
	end
    
    def askAmountUsers(amount)
        @log_file.puts("#{amount} was inserted on askAmountUsers method")
    	if(amount <= 15 && amount >=3)
    		while amount > 0 do
    		   insertCredentials
    		   amount -= 1	
    		end
    	end
    end

    def askConvertionType
        puts("What type of convertion do you want to do?")
        puts("a) From Millimeters to centimeters")   	
        puts("b) From centimeters to meters")   	
        puts("c) From meters to Kilometers")   	
        option = gets.chomp
        puts("Option selected by User: #{option}")
        @log_file.puts("The option #{option} was inserted on askConverationType method")
        return option
    end
   
    def giveCalculation
    	option = askConvertionType
    	calcResult = 0
    	num = 0
    	case 
    	when option == "a"
    	   puts("Insert the values in millimeters")
    	   num = gets.chomp.to_i
           @log_file.puts("num: #{num} is the value for millimters")
           calcResult = DistanceConvertion.millimetersToCentimeters(num)
    	when option == "b"
    	   puts("Insert the values in centimeters")
    	   num = gets.chomp.to_i
           @log_file.puts("num: #{num} is the value for centimeters")
           calcResult = DistanceConvertion.centimeterToMeters(num)
    	when option == "c"
    	   puts("Insert the values in kilometers")
    	   num = gets.chomp.to_i
           @log_file.puts("num: #{num} is the value for kilometers")
    	   calcResult = DistanceConvertion.metersToKilometers(num)
    	end
        puts("#{num} represents #{calcResult}")
    end

    def askUserRegister	
        puts("Do you want to perform a calculation?")
        puts("Yes > Y")
        puts("No > N")
        res = gets.chomp
        if res == "Y"
          	askConvertionType
        else
        	puts("Good Bye!!!")
        	@users_with_no_calculation.push(@name)
        end
       @log_file.puts("#{@users_with_no_calculation} -> was returned by the method")
       return @users_with_no_calculation
    end	
   
    def printUsersWithNoCalculation
        @log_file.puts("Printing... #{@users_with_no_calculation}")
    	p @users_with_no_calculation
    end

end

reg = Registration.instance
reg.insertCredentials