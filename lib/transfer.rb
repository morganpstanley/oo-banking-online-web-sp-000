class Transfer
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    @sender.balance += @amount
    @receiver.balance -= @amount
  end





end
