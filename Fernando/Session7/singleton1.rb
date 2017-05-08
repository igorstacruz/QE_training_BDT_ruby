require "singleton"

class SingletonExample
 include Singleton  
 attr_accessor :user
 attr_reader :message

	def initialize
	   @visitors = 0	
	   @hash_users = Hash.new
	   @user = "Guest"
	   @message = "Welcome to the city"
	end

    def addUser(user)
    	@user = user
    end

    def addWelcomeMessage(message)
        @message = message
    end

    def incrementVisitors
    	@hash_users[@user] = [@message]
    	@visitors += 1 
    end

end

singletonE = SingletonExample.instance
singletonE.addUser("Fernando") 
singletonE.addWelcomeMessage("Welcome to the ruby class") 
p singletonE.user

singletonE2 = SingletonExample.instance
p singletonE2.user
p singletonE2.message

