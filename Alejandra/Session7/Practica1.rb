def shopping_instance 
	@shopping_instance ||= Shopping.new 
end

class Shopping
	attr_reader :items_price_list
	attr_reader :items_qty_list
	def initialize 
		@items_number = 0
		@items_price_list = Hash["short", 23.2, "umbrella", 15.0, "socks", 5.0, "t-shirt", 10.5, "pants", 8.0]
		@items_qty_list = Hash["short", 8, "umbrella", 10, "socks", 20, "t-shirt", 50, "pants", 40]
		@item_discount = 0.0
		@items_selected = Hash.new
	end

	def buy_item
		puts "Write an item: "
		item = gets.chomp
		puts "Write the amount: "
		amount = gets.chomp.to_i
		@items_qty_list[item] -= amount
		@items_number += 1
		@items_selected.store item, amount
	end

	def calculate_items_price
		items_selected_price = Hash.new
		@items_selected.each {|item, amount|
			items_selected_price.store item, "#{(@items_price_list[item] * amount)}  $us"
		}
		items_selected_price
	end
end

puts "Item prices: "
p shopping_instance.items_price_list
puts "Item quantities: "
p shopping_instance.items_qty_list
shopping_instance.buy_item
shopping_instance.buy_item
shopping_instance.buy_item
shopping_instance.buy_item
puts "Items you bought: "
p shopping_instance.calculate_items_price
puts "Balance of items: "
p shopping_instance.items_qty_list

#We need to use a Singleton patter to instance the class due to the method but_item should be call several times during the shopping,
#and the instance of the Shopping should be a unique instance to not lost the previous values saved (items) during the program execution