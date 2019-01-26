class Billing
  include ActiveModel::Model

  attr_accessor :card_number,
                :expiration_day,
                :expiration_month,
                :cvv,
                :zip_code

  validates :card_number,      presence: true, allow_blank: false
  validates :expiration_day,   presence: true
  validates :expiration_month, presence: true
  validates :cvv,              presence: true, allow_blank: false
  validates :zip_code,         presence: true, allow_blank: false
end
