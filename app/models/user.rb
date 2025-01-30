class User < ApplicationRecord
  has_many :exchanges
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :bank_account, presence: true
end

