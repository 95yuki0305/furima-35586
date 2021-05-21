class Order < ApplicationRecord
  belongs_to :product
  has_one :address
end