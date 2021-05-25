require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.build(:product)
    product.image = fixture_file_upload("/files/test_image.png")
    product.save
    @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品を購入できるとき' do
      it 'token,postal_code,prefecture_id,municipality,house_number,phone_numberが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'tokenが存在すれば購入できる' do
        @order_address.token = 'tok_abcdefghijk00000000000000000'
        expect(@order_address).to be_valid
      end
      it 'postal_codeを入力すると購入できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'prefecture_idを入力すると購入できる' do
        @order_address.prefecture_id = (2)
        expect(@order_address).to be_valid
      end
      it 'municipalityを入力すると購入できる' do
        @order_address.municipality = '横浜市緑区'
        expect(@order_address).to be_valid
      end
      it 'phone_numberを入力すると購入できる' do
        @order_address.phone_number = '09012345678'
        expect(@order_address).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'tokenが存在していないと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeを入力していないと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフン(-)が入力していないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを入力していないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'municipalityを入力していないと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'phone_numberを入力していないと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以上入力すると購入できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits, do not include hyphens(-)")
      end
      it 'phone_numberは11桁以内でもハイフン(-)が入力されていると購入できない' do
        @order_address.phone_number = '012-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits, do not include hyphens(-)")
      end
      it 'phone_numberが英数混合では購入できない' do
        @order_address.phone_number = 'a0123456b'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits, do not include hyphens(-)")
      end
      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では購入できない' do
        @order_address.product_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end