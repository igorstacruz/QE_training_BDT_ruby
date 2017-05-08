require 'singleton'  
 class Visit  
    include Singleton
    attr_reader :user
    attr_reader :message
    attr_reader :visitors  	  
 	def initialize
         @user= "Guest"
         @message = "Welcome to the city"
         @visitors = 0
         @users = {}
 	end

 	def add_user  name, message
         @user= name
         @message = message
         @users.store(@user, @message)
         @visitors = @visitors + 1
  end

 	def print_users 
      puts "list of users and messages:"
      p @users
 	end
 end 


testVisit = Visit.instance
testVisit.add_user("Juan","Hello there")
testVisit.add_user("Pedro","Hello!!!")
testVisit.add_user("Ana","Good Morning")
testVisit.add_user("Tester","Hi")
puts "using attribute reader get last user"
puts "last user inserted: #{testVisit.user}"
puts "Nuber of users: #{testVisit.visitors}"
testVisit.print_users
