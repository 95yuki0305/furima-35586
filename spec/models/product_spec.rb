require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload("/files/test_image.png")
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it 'image,name,description,category,status,shinpping_charge,prefecture,days_to_ship,selling_priceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'imageを選択すると登録できる' do
        @product.image = fixture_file_upload("/files/test_image.png")
        expect(@product).to be_valid
      end
      it 'nameを入力すると登録できる' do
        @product.name = 'hoge'
        expect(@product).to be_valid
      end
      it 'descriptionを入力すると登録できる' do
        @product.description = 'hoge'
        expect(@product).to be_valid
      end
      it 'categoryを入力すると登録できる' do
        @product.category = Category.find(2)
        expect(@product).to be_valid
      end
      it 'statusを入力すると登録できる' do
        @product.status = Status.find(2)
        expect(@product).to be_valid
      end
      it 'shinpping_chargeを入力すると登録できる' do
        @product.shinpping_charge = ShinppingCharge.find(2)
        expect(@product).to be_valid
      end
      it 'prefectureを入力すると登録できる' do
        @product.prefecture = Prefecture.find(2)
        expect(@product).to be_valid
      end
      it 'days_to_shipを入力すると登録できる' do
        @product.days_to_ship = DaysToShip.find(2)
        expect(@product).to be_valid
      end
      it 'selling_priceを入力すると登録できる' do
        @product.selling_price = '1000'
        expect(@product).to be_valid
      end
    end
    context '商品の出品が出来ないとき' do
      it 'imageを選択していないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40字以上では出品できない' do
        @product.name = 'a' * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'descriptionが1000字以上では出品できない' do
        @product.description = 'a' * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it 'categoryが「---」だと出品できない' do
        @product.category = Category.find(1)
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'statusが「---」だと出品できない' do
        @product.status = Status.find(1)
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it 'shinpping_chargeが「---」だと出品できない' do
        @product.shinpping_charge = ShinppingCharge.find(1)
        @product.valid?
        expect(@product.errors.full_messages).to include("Shinpping charge must be other than 1")
      end
      it 'prefectureが「---」だと出品できない' do
        @product.prefecture = Prefecture.find(1)
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'days_to_shipが「---」だと出品できない' do
        @product.days_to_ship = DaysToShip.find(1)
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'selling_priceが空では出品できない' do
        @product.selling_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが全角数字では出品できない' do
        @product.selling_price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price is not a number")
      end
      it 'selling_priceが300円以下では出品できない' do
        @product.selling_price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end
      it 'selling_priceが9999999円以上では出品できない' do
        @product.selling_price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
    end
  end
end