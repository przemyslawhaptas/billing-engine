class Customer < ApplicationRecord
  has_many :subscriptions
  has_one :billing
  has_one :shipping
end
