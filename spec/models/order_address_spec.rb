require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do 
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品を購入する' do
    context '商品が購入できる場合' do
      it '全ての値が正しく入力されていれば、保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること ' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'Prefectureが空では出品できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'houser_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上でないと保存できないこと' do
        @order_address.phone_number = 12345678
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_numberが半角数値でない場合、保存できない' do
        @order_address.phone_number= 'abcdefghtq'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect( @order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect( @order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end



    end
  end
end
