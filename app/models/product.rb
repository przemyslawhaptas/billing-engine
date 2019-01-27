class Product
  include ActiveModel::Model

  attr_accessor :id,
                :price,
                :name

  validates :id,    presence: true, allow_blank: false
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :name,  presence: true, allow_blank: false
end
