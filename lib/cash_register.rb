require 'pry'

class CashRegister
    
attr_accessor :total, :discount


    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
        @list = {}
    end

    def add_item(title, price, quantity=1)
        @total += price*quantity
        (@list[title] =[]) << (price*quantity)
        if quantity == 1
            @cart << title
        elsif quantity > 1
            quantity.times{@cart << title}
        end
        return @total

    end
    

    def apply_discount
        if @discount > 0
            @total -= total*discount/100
            "After the discount, the total comes to $#{@total}."
        else "There is no discount to apply."  
        end
    end

    def items
        @cart
    end
    
    def void_last_transaction
        # if @list.size === 0
        #     @total = 0.00
        # else
            @total -=(@list[self.items.last]).join("").to_f 
        # end   
    end

end

cash_register = CashRegister.new
cash_register.add_item("apple", 0.99)
cash_register.add_item("tomato", 1.76)
cash_register.void_last_transaction
cash_register.void_last_transaction
#binding.pry