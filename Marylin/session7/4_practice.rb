require 'singleton'
class Base
	include Singleton
	def initialize
		@user="Guest"
		@message="Welcome to the city"
		@visitors=0
	end
	def add_new_user
		puts "Type the user: "
		@user = gets.chomp.to_s
		puts "Type a message: "
		@message = gets.chomp.to_s
		@visitors += 1
	end
	def get_visitors
		@visitors
	end
end

user=Base.instance
p user.add_new_user
p user.get_visitors
p user.add_new_user
p user.get_visitors