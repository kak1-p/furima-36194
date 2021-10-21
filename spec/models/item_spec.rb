require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "ユーザー新規登録" do
    it '全ての項目が入力されていれば保存できる' do
      expect(@item).to be_valid
    end
    it '画像がなければ保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名がなければ保存できない' do
      @item.items_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Items name can't be blank"
    end
    it '商品の説明がなければ保存できない' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Detail can't be blank"
    end
    it 'カテゴリーのidが1だと保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態のidが1だと保存できない' do
      @item.status_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end
    it '配送料の負担のidが1だと保存できない' do
      @item.fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Fee can't be blank"
    end
    it '発送元の地域のidが1だと保存できない' do
      @item.city_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "City can't be blank"
    end
    it '発送までの日数のidが1だと保存できない' do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery date can't be blank"
    end
    it '販売価格が空白だと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格が半角数字以外だと保存できない' do
      @item.price = '９９９'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include 'User must exist'
    end
  end
end
