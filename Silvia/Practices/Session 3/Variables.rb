$example_of_global= 6

module ModuleTest        
    puts "Inside module"
    puts $example_of_global

    def test
    	puts "Static method?"
   	end
end

def method_test
    puts "Inside method"
    puts $example_of_global
end

class Some_test
    puts "Inside class"
    puts $example_of_global
end 

method_test 
puts "Inside toplevel"
puts $example_of_global
puts global_variables.include?:$example_of_global
