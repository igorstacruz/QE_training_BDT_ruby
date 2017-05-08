class Example_of_class
	def initialize
		puts "Creating object"
	end
  	def first_method
    	puts "My first instance method"
  	end
  	def second_method 
    	puts "My second instance method"
  	end  	
end

Example_of_class.new.first_method  # " My first instance method"

objA = Example_of_class.new
objA.second_method

class Shape
	def initialize radio
		@shape_radio = radio
		puts "Creating Shape"
	end
  	def calculate_circle_area
  		area = @shape_radio * 2 * Math::PI
    	puts "The area is: #{area}"
  	end
  	def calculate_perimeter
  		perimeter =  @shape_radio * @shape_radio * 2
    	puts "The perimeter is: #{perimeter}"
  	end  	
end

radio = gets.chomp.to_f
circle = Shape.new(radio)
circle.calculate_circle_area
circle.calculate_perimeter