class Shipping < ApplicationRecord
  belongs_to :customer

  validates :name,     presence: true, allow_blank: false
  validates :address,  presence: true, allow_blank: false
  validates :zip_code, presence: true, allow_blank: false
end
