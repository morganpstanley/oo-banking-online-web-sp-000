require 'pry'

class Transfer
  attr_reader :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    binding.pry
    if self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end

end
