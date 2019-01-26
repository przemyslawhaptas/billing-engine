class Billing
  include ActiveModel::Model

  attr_accessor :card_number, :expiration_day, :expiration_month, :cvv, :zip_code
end
