require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '配送先情報' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていてtokenがあれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '保存できない場合' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号は「3桁 - 4桁」以外だと保存できない' do
        @order_address.postal_code = '1111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '郵便番号は半角数字以外だと保存できない' do
        @order_address.postal_code = '１１１-１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '都道府県のidが1だと保存できない' do
        @order_address.city_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '市区町村が空だと保存できない' do
        @order_address.town = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Town can't be blank"
      end
      it '番地が空だと保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空だと保存できない' do
        @order_address.tell = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tell can't be blank"
      end
      it '電話番号が9桁以下だと登録できない' do
      @order_address.tell = 111111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tell is invalid"
      end
      it '電話番号が12桁以上だと登録できないこと' do
        @order_address.tell = 111111111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tell is invalid"
      end
      it '電話番号は半角数字以外だと保存できない' do
        @order_address.tell = '１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tell is invalid"
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていなければ投稿できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
