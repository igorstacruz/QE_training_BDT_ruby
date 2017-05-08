require "singleton"

class Shopping
  include Singleton  
  attr_reader :hashItems

	def initialize()
    items = {
           "Headphones" => [10.5, 100, 0.05],
           "Monitor" => [150.8, 200, 0.20],
           "Keyboard" => [30.7, 100, 0.10],
           "Books" => [300.7, 200, 0.03],
           "Magazines" => [10.5, 200, 0.3]
        }

    @hashItems = items
    @posPrice = 0
    @posQtty = 1
    @posDiscount = 2
    
	end

	def buyItem(item, amount)
    @hashItems[item][@posQtty] -= amount 
	end

	def calculatePrice(item, amount)
    return @hashItems[item][@posPrice] * amount
	end	

  def printItemsWithPrice
    puts "**********************"
      @hashItems.each do |key, value|
        puts "#{key} : #{value[0]}$"
      end   
    puts "**********************"  
  end 
end


shopping = Shopping.instance
shopping.printItemsWithPrice

item = "Headphones"
amount = 40
shopping.buyItem(item, amount)

price = shopping.calculatePrice(item, amount)
puts("The cost of #{item} for #{amount} units is: #{price}") 
