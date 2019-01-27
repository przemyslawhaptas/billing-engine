class CreditCard
  include ActiveModel::Model

  attr_accessor :card_number,
                :expiration_month,
                :expiration_year,
                :cvv,
                :zip_code

  validates :card_number,      presence: true, allow_blank: false
  validates :expiration_month, presence: true
  validates :expiration_year,  presence: true
  validates :cvv,              presence: true, allow_blank: false
  validates :zip_code,         presence: true, allow_blank: false
end
