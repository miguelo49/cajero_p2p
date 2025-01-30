class Exchange < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :exchange_type, presence: true, inclusion: { in: ['virtual_to_cash', 'cash_to_virtual'] }
  validates :location, presence: true
  validates :status, presence: true, inclusion: { in: ['available', 'in_progress', 'completed'] }

  scope :available, -> { where(status: 'available') }
  scope :by_amount_range, ->(min, max) { where(amount: min..max) }
  scope :by_location, ->(location) { where(location: location) if location.present? }
end

