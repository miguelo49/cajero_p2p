class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :buyer, class_name: "User", optional: true
  enum :exchange_type, {cash_to_virtual: "cash_to_virtual", virtual_to_cash: "virtual_to_cash"}
  enum :status, {available: "available", pending: "pending", completed: "completed"}
end
