<<<<<<< HEAD
=begin
Ruby File
=end

# file_example.write('line1')
# file_example.write("\n")
# file_example.write('line2')
# file_example.write("\n")
# file_example.close

# file_example = File.open('test.txt')
# puts file_example.read

class MyFile
	attr_accessor :number_of_lines
	def initialize
		@file_example = File.open('test.txt','w+')
		@file_example.truncate(0)
	end
	def ask_number_lines
		puts "Please enter the number of the lines"
		@number_of_lines = gets.chomp.to_i	
	end	
	def write_file
		counter = 1
		while counter <= @number_of_lines do
			@file_example.write(gets.chomp)
			@file_example.write("\n")
			counter += 1
		end
		@file_example.close
	end
end

file = MyFile.new
file.ask_number_lines
=======
=begin
Ruby File
=end

# file_example.write('line1')
# file_example.write("\n")
# file_example.write('line2')
# file_example.write("\n")
# file_example.close

# file_example = File.open('test.txt')
# puts file_example.read

class MyFile
	attr_accessor :number_of_lines
	def initialize
		@file_example = File.open('test.txt','w+')
		@file_example.truncate(0)
	end
	def ask_number_lines
		puts "Please enter the number of the lines"
		@number_of_lines = gets.chomp.to_i	
	end	
	def write_file
		counter = 1
		while counter <= @number_of_lines do
			@file_example.write(gets.chomp)
			@file_example.write("\n")
			counter += 1
		end
		@file_example.close
	end
end

file = MyFile.new
file.ask_number_lines
>>>>>>> c7b82188e927e8f9a9065f3626d173af3fe7212f
file.write_file