require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_order = FactoryBot.build(:buyer_order, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入ができる場合' do
      it '全ての情報が正しく入力されているとき' do
        expect(@buyer_order).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @buyer_order.building = ''
        expect(@buyer_order).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it 'postal_codeが空では登録できない' do
        @buyer_order.postal_code = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codenにハイフンがないと登録できない' do
        @buyer_order.postal_code = '1234567'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Postal code is invalid')
      end

      it 'brand_idが空だと登録できない' do
        @buyer_order.brand_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Brand can't be blank")
      end

      it 'brand_idが未選択のidだと登録できない' do
        @buyer_order.brand_id = 1
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Brand must be other than 1')
      end

      it 'cityが空だと保存できない' do
        @buyer_order.city = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できない' do
        @buyer_order.address = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @buyer_order.phone_number = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと保存できない' do
        @buyer_order.phone_number = '090123456789123456789'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角だと保存できない' do
        @buyer_order.phone_number = '０９０１１１１２２２２'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberにハイフンがあると保存できない' do
        @buyer_order.phone_number = '090-1111-2222'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが英数混合だと保存できない' do
        @buyer_order.phone_number = '090-1aaa-22bb'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空だと保存できない' do
        @buyer_order.token = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが存在しないと保存できない' do
        @buyer_order.user_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが存在しないと登録できない' do
        @buyer_order.item_id = ''
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
