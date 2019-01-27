class Billing < ApplicationRecord
  belongs_to :customer

  validates :purchase_token, presence: true, allow_blank: false, uniqueness: true
end
