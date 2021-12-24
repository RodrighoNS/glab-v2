class Expense < ApplicationRecord
  validates_presence_of :item, :amount, :payment_status
end
