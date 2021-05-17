class Product < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shinpping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }, allow_blank: true
    validates :description, length: { maximum: 1000 }, allow_blank: true
    validates :image
    validates :selling_price, format: { with: /\A[0-9]+\z/, allow_blank: true}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, allow_blank: true} 
  end
  validates  :name, :description, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shinpping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end