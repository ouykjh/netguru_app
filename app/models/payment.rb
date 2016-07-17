class Payment < ActiveRecord::Base
  belongs_to :student

  validates :amount, :paid_date, presence: true
end
