class Shipping
  include ActiveModel::Model

  attr_accessor :name,
                :address,
                :zip_code

  validates :name,     presence: true, allow_blank: false
  validates :address,  presence: true, allow_blank: false
  validates :zip_code, presence: true, allow_blank: false
end
