class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders
  has_many :products
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, :password_confirmation, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, allow_blank: true}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, allow_blank: true} do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true} do
      validates :family_name_ruby
      validates :first_name_ruby
    end
  end
end
