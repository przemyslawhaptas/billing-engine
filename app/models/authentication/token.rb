module Authentication
  class Token < ApplicationRecord
    validates :value, uniqueness: true, presence: true, allow_blank: false
  end
end
