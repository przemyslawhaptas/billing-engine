class Product
  include ActiveModel::Model

  TYPES = %w(bronze silver gold)

  attr_accessor :id,
                :price,
                :name
end
