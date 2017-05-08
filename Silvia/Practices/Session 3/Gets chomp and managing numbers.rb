#Get value from the console
puts "What is your name?"
name = gets.chomp		#chomp to remove the new line char
puts "Hi #{name}!!. How are you?"

#Concat strings
num = 1
text = "bla"
puts text + " " + num.to_s

#Convert types
print "Give me a number: " 
number = gets.chomp.to_i	#for any string return 0
bigger = number * 100		#returns an error if we do not use to_i
puts "The integer number is : #{number}"	

print "Give me a number: " 
number = gets.chomp.to_f 		#for any string return 0.0
puts "The floating number is : #{number}"
