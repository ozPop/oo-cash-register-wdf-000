require 'pry'
class CashRegister
  attr_accessor :discount, :total, :all, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @all = []
    @last_transaction = nil
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      self.all << title
    end
    self.last_transaction = price
  end

  def apply_discount
    if self.discount > 0
      percentage = 1 - ( self.discount.to_f / 100 )
      self.total = self.total * percentage
      self.total = self.total.to_i
      return "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
    # binding.pry
  end

  def items
    self.all
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end