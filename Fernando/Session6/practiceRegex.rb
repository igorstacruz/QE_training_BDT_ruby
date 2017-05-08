=begin 
Add a method that is going to ask for a username :
Need to be write with lowercase letter (a-z), number (0-9), an underscore

Add a method that is going to ask for a password:
Need to be write with lowercase letter (a-z), number (0-9), letter (A-Z) and the length have to be between 8 and 16 characters

Add a method that is going to ask for email
Need to have the format anything@domain.com (could accept also country e.g. anything@domain.com.bo)

=end

def askUserName
	while true
		puts("Please insert a user name")
	    name = gets.chomp
		if (name =~ /(^([a-z]|[0-9]|[_]){1,}$)/)
			puts("Success!!!")
			break
		else
			puts("Your name should contains only lowercase, numbers or underscore")
		end
		
	end
end

def askUserPassword
	while true
		puts("Please insert a valid password")
	    password = gets.chomp

		if (password =~ /(^([a-z]|[A-Z]|[0-9]){8,16}$)/)
			puts("Success!!!")
			break
		else
			puts("Your password should contain lowercase, uppercase or numbers ")
			puts("Also your password should be between 8 and 16 characters")
		end
		
	end
end

def askUserEmail
	while true
		puts("Please insert a user email")
	    password = gets.chomp

		if (password =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]{1,3})+(\.[a-z]{1,5})$/)
			puts("Success!!!")
			break
		else
			puts("Your email should meets the format e.g someone@gmail.com.bo")
		end
	end
end

askUserName
askUserPassword
askUserEmail