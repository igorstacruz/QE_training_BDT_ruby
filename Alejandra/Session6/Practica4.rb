class Class1
	attr_reader :hash_elements
	def method1
		@hash_elements = Hash.new
		puts "Get size: "
		size = gets.chomp.to_i
		size.times {
		puts "Get value: "
		value = gets.chomp
		puts "Get key: "
		key = gets.chomp
		hash_elements.store key, value}
	end

	def print_keys
		p @hash_elements.keys
	end

	def print_values
		p @hash_elements.values
	end

	def print_hash
		p @hash_elements
	end

	def does_key_exist key
		p @hash_elements.has_key? key
	end

	def does_value_exist value
		p @hash_elements.has_value? value
	end
end

class1 = Class1.new
class1.method1
class1.print_keys
class1.print_values
class1.print_hash
class1.does_key_exist "a"
class1.does_value_exist "123"
