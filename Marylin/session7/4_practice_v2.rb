require 'singleton'
class Base
	include Singleton
	attr_accessor :last_user
	def initialize
		@user_list = Hash.new
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
		@user_list.store @user,@message
	end
	def get_visitors
		@visitors
	end

	def get_last_user
		@last_user = @user_list[@user_list.length - 1]
	end
end

user=Base.instance
p user.add_new_user

p user.get_visitors
p user.add_new_user
p user.get_visitors

p user.user