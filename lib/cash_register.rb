class CashRegister

    attr_accessor :total, :discount, :items, :last

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @item_price = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        @items += [title] * quantity
        @item_price << price * quantity
    end

    def apply_discount
        if !discount 
            return "There is no discount to apply."
        end
        @total *= (1 - @discount/100.0)
        "After the discount, the total comes to $#{@total.to_i}."
    end

    def void_last_transaction
        @items = @items.pop
        @total -= @item_price[-1]
        @item_price = @item_price.pop
        @items.length == 0 ? @total = 0.0 : nil
    end

end