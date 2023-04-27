require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it '名字が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '名字（カナ）が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it '名前（カナ）が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it '生年月日が空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'abcd１２３'
        @user.password_confirmation = 'abcd１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'ichiro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.family_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it '姓（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.family_name_kana = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it '姓（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
        @user.family_name_kana = 'suzuki51'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it '姓（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.family_name_kana = 'スズキ*'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end
      it '名（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.last_name_kana = 'いちろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it '名（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.last_name_kana = '一郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it '名（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
        @user.last_name_kana = 'ichiro51'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it '名（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.last_name_kana = 'イチロー*'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
    end
  end
end
