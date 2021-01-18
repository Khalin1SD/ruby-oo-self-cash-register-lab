require 'pry'
class CashRegister

attr_accessor :total, :item, :last_item
attr_reader :discount

    def initialize(discount = 0, total = 0, cart = [], authorized = false) 
        @total = total
        @discount = discount
        @cart = []
        @authorized = false

        if @discount != 0 
            @authorized = true
        end

    end

    def add_item(item, price, quantity=1)
        item_info = {}
        item_info[:item] = item
        item_info[:price] = price
        item_info[:quantity] = quantity

        @cart << item_info

        @total += price * quantity
    end

    def authorized_cart
    @authorized = true
    end

    def apply_discount 
        if @authorized == true 
            @total -= @total * (@discount / 100.0)
            "After the discount, the total comes to $#{@total.round}."
        else #@authorized_cart == false
            "There is no discount to apply."
        end


    end

    # def items
    #     @cart.map{[x] x[:item]} 
    # end










end


binding.pry




