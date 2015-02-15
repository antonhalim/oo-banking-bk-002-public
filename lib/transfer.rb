class Transfer
  require 'pry'
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @both_valid = false
  end

  def both_valid?
    if sender.valid? && receiver.valid? == true
     @both_valid = true
   else
     @both_valid = false
   end
 end

 def execute_transaction
  if self.status == "pending" && self.both_valid? == true && sender.balance > @amount
    sender.balance -= 50
    receiver.balance += 50
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete" && self.both_valid? == true && sender.balance > @amount
    sender.balance += 50
    receiver.balance -= 50
    self.status = "reversed"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 
end

end
