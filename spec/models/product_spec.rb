require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it 'name,description,category_id,shinpping_charge_id,prefecture_id,days_to_ship_id,selling_priceが存在すれば登録できる' do
        expect(@product).to be_valid
      end

    end
  end
end