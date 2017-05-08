require 'singleton'  
 class Base  
  include Singleton  
 	def initialize
         @value= 0
 	end
 	def any
         @value= 10
 	end
 	 def some
         @value
 	end
 end 

#b1 = Base.new  #private method `new' called for Base:Class (NoMethodError)
b1 = Base.instance
p b1.any
b2 = Base.instance
p b2.some