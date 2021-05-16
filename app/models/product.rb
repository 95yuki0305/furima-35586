class Product < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shinpping_charges
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end
  validates  :name, :description, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shinpping_charges_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
