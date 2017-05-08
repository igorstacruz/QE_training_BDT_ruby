class Class1
	attr_reader :users
	def initialize persons
		@persons = persons
	end
	def get_users
		@users = Hash.new
		@persons.times {
			puts "Get ID: "
			id = gets.chomp
			puts "Get Name: "
			name = gets.chomp
			users.store id, name
		}
	end
	def names_upercase
		users_in_upcase = Array.new
		@users.each_with_index {|(id,nane), index| 
			users_in_upcase.push(@users[id].upcase)
			p "Position: #{index} UserName: #{@users[id]}"
		}
		p users_in_upcase
	end

	def say_good_bye_to_all
		@users.each {|id, name| 
			p "Good bye #{@users[id]}"
		}
	end
end

puts "Get amount of persons: "
persons = gets.chomp.to_i
class1 = Class1.new(persons)
class1.get_users
class1.names_upercase
class1.say_good_bye_to_all
