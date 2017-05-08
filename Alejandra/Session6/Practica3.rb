class Class1
	def self.method1
		array_numbers = Array.new
		array_strings = Array.new
		puts "Get size: "
		array_size = gets.chomp.to_i
		array_size.times {
			puts "Get number: "
			value = gets.chomp.to_i
			array_numbers.push value
			puts "Get string: "
			value = gets.chomp
			array_strings.push value
		}
		return array_strings.sort, array_numbers, array_numbers + array_strings
	end

	def self.method2 array1, array2
		return array1 & array2, [array1.shift, array2.shift], [array1.pop, array2.shift]
	end

	def self.method3 array1, array2
		array1.shift
		array2.pop
		return array1 + array2
	end

	def self.method4 array
		p array
	end
end

array_strings, array_numbers, array_mixed= Class1.method1
puts "Numbers : #{array_numbers}"
puts "Strings sorted: #{array_strings}"
puts "Mixed Numbers Strings: #{array_mixed}"

array1 = ["a", "b", "c","d"]
array2 = ["a", "d", "r", "x"]
common_elements, first_elements, last_elements = Class1.method2(array1, array2)
puts "Common elements: #{common_elements}"
puts "First elements: #{first_elements}"
puts "Last elements: #{last_elements}"
Class1.method4(Class1.method3(array1, array2))