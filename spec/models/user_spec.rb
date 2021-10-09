require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it '全ての項目が入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@が含まれていない場合は登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordは半角英数混合でなければならない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '全角を含むパスワードでは登録できない' do
      @user.password = '１１１１１A'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '名字(全角)が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it '名前(全角)が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '名字は全角(漢字,ひらがな,カタカナ)でなければならない' do
      @user.family_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end
    it '名前は全角(漢字,ひらがな,カタカナ)でなければならない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it '名字カナ(全角)が空では登録できない' do
      @user.family_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name k can't be blank"
    end
    it '名前カナ(全角)が空では登録できない' do
      @user.first_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name k can't be blank"
    end
    it '名字カナは全角カタカナでなければならない' do
      @user.family_name_k = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name k is invalid"
    end
    it '名前カナは全角カタカナでなければならない' do
      @user.first_name_k = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name k is invalid"
    end
    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end
  end
end
