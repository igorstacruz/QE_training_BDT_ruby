=begin
Create 1 Class considering :
Method that will create a hash with a list of userID and userName,
the userID should be only numbers between 1 to 100. Username 
should be only lowercase (nor more than 8 digits)

Method that is going to request to the user for a number (only 1 number) 
and need to return the amount of users that have their user ID starting 
with the number inserted (E.g. if user inserted 1, then could count all 
users with 1, 10,11,12,13..19 or 100), return and array with the user_ID 
that fulfilled this condition

Method that is going to request to the user for a character (only 1 char)
 and need to return the amount of users that have their  
 userName starting with the character inserted 
 (E.g. if user inserted a, then could count all users that start with a), 
 return and array with the list of userName that fulfilled this condition

Method to display a message considering :
UseID between 1-25 “User belong Group 1”
UseID between 26-50 “User belong Group 2”
UseID between 51-75 “User belong Group 3”
UseID between 76-100 “User belong Group 4”
Consider to use Case Equality 
Method to print the array received

=end

class RegexPractice
   def initialize
       @users = Hash.new
   end   
   
   def insertUser
   	 puts("Please insert the ID") 
   	 id = waitRegexSuccess("(^([0-9]){1,100}$)", "The ID should only contains numbers")
     id = id.to_i

   	 puts("Please insert the User name") 
   	 name = waitRegexSuccess("(^([a-z]){1,8}$)", "Your name should be only lowercase")

     @users[id] = name
  end	

  def waitRegexSuccess(regex, messageWhenFails)
     while true
	    textToEvaluate = gets.chomp
			if (textToEvaluate =~ /#{regex}/)
				return textToEvaluate
			else
				puts(messageWhenFails)
				puts("Please try again!!!") 
			end
	  end  	
  end

  def getAmountIDThatMeetsReq
  	puts("Plese insert a number")
  	id = waitRegexSuccess("(^([0-9]){1,1}$)", "The id only should be one number")
  	amount = 0
  	idsThatMeets = []
    @users.each do  |key, value| 
	     if(key.to_s =~ /(^([#{id}]){1,})/) 
	     	amount +=1
	     	idsThatMeets.push(key)
	     end
	end

    return amount, idsThatMeets
  end

  def getAmountNamesThatMeetsReq
  	puts("Please insert one character")
  	character = waitRegexSuccess("(^([a-z]){1,1}$)", "The character inserted should be alphabetical character")
  	amount = 0
  	nameThatMeets = []
    @users.each do  |key, value| 
	     if(value =~ /(^([#{character}]){1,})/) 
	     	amount +=1
	     	nameThatMeets.push(value)
	     end
	end
	
    return amount, nameThatMeets
  end

  def printUserGroups
    message = ""
        
    @users.each do |key, value| 
	    case key
		   when 1..25 
		   	 message = "UserID: #{key} between 1-25 User belong Group 1"
             puts(message)

		   when 26..50 
		   	 message = "UserID: #{key} between 26-50 User belong Group 2"
             puts(message)

		   when 51..75 
		   	 message = "UserID: #{key} between 51-75 User belong Group 3"
             puts(message)

		   when 76..100
		   	 message = "UserID: #{key} between 76-100 User belong Group 4"
             puts(message)
	   end
	end
  end

end


regexPractice = RegexPractice.new
regexPractice.insertUser
regexPractice.insertUser

p regexPractice.getAmountIDThatMeetsReq
p regexPractice.getAmountNamesThatMeetsReq()
regexPractice.printUserGroups




