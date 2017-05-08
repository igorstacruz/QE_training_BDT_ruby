class HashExample
	attr_reader :userHash

    def initialize
       @userHash = Hash.new      
    end

	def askUser(length)
	   length = length.to_i	   
	   length.times do
	     puts("Please insert the key")    
	   	 key = gets.chomp
	     puts("Please insert the value")    
	     value = gets.chomp
	     @userHash[key] = [value]
	   end
	end

	def printHashKeys
        @userHash.each do |key, value|
		   puts("#{key}")
	    end
	end

	def printHashValues
		@userHash.each do  |key, value| 
		   puts("#{value}")
	    end
	end
   
    def printHash
        p @userHash
    end

    def keyIsInTheHash(key)
    	@userHash.has_key?(key)
    end
   
    def valueIsInTheHash(value)
       @userHash.has_value?(value)
    end
end


hashExample = HashExample.new
hashExample.askUser(2)
hashExample.printHashKeys
hashExample.printHashValues
hashExample.printHash
hashExample.keyIsInTheHash(1)
hashExample.valueIsInTheHash(2)