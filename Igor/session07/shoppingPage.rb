require 'singleton'


class ShoppingPage
    include Singleton
    attr_reader :items

    def initialize
        @items = {
            "apple"=> { "price" => 5, "quantity" => 12, "discount" => 0 },
            "banana" => { "price" => 10, "quantity" => 25, "discount" => 0 },
            "melon"=> { "price" => 18, "quantity" => 5, "discount" => 0 }
            }
        @balance = {"apple"=> 0, "banana" =>  0, "melon"=> 0 }
    end
    def buy_item item, quantity
        puts "you are trying to buy #{quantity} of #{item}"
        if quantity <= @items[item]["quantity"] then
            @items[item]["quantity"] -= quantity
            total_price = self.calculate_price(item, quantity)
            @balance[item] = @balance[item] + total_price
        else
            puts "you only have #{@items[item]["quantity"]} of #{item} cannot buy #{quantity}"
        end
    end
    
    def calculate_price item, quantity
      price = @items[item]["price"] * quantity
      return price
    end
    

    def print_balance
        puts "Balance of items to buy: "
        p @balance
        total_to_pay = 0
        @balance.each do |key, value|
            total_to_pay = total_to_pay + value
        end
        puts "Total amount: #{total_to_pay}"
    end
end

shoppingPage = ShoppingPage.instance
shoppingPage.buy_item("banana",10)
shoppingPage.buy_item("melon",4)
shoppingPage.buy_item("banana",5)
shoppingPage.buy_item("apple",15)
shoppingPage.buy_item("apple",12)
shoppingPage.print_balance()
puts "items remain on the store:"
p shoppingPage.items
