class CreditCard
  include ActiveModel::Model

  attr_accessor :card_number,
                :expiration_month,
                :expiration_year,
                :cvv,
                :zip_code
end
