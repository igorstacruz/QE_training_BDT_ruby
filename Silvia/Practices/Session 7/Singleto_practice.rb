class Guest
	attr_accessor :user
	attr_reader :hash
	attr_reader :visitors
	 def initialize
         @user = "Guest"
         @message = "Welcome to the city"
         @visitors = 0
         @hash = {}
         @hash [@user] = @message
 	end
 	def add_to_hash
 		@user = gets.chomp
 		@message = gets.chomp
 		@visitors += @visitors + 1 
 		@hash [@user] = @message
 	end
end

def singletn_example
	@singletn_example ||= Guest.new
end

p singletn_example.add_to_hash
p singletn_example.add_to_hash
p "Last user: #{singletn_example.user}"
p "Visitors: #{singletn_example.visitors}"
p singletn_example.hash