require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_nameとemail,passwordとpassword_confirmation,last_nameとfirst_name,last_name_kanaとfirst_name_kana, date_birthが存在すれば登録できる' do
        @user.valid?
      end
    end


    context '新規登録できない場合' do
      it "nick_nameが空では登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "Emailに@を含まない場合、登録できない" do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '新規登録できない場合 英文字のみのパスワードでは登録できない' do
        @user.password = "onlyletters"
        @user.password_confirmation = "onlyletters"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'
        @user.password_confirmation = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'nybc12'
        @user.password_confirmation = 'nybc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "Last nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank" )
      end

      it "Last nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters.")
      end

      it "First nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank" )
      end

      it "First nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters.")
      end

      it "Last name kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank" )
      end

      it "Last name kanaが全角文字（カタカナ）で入力しない場合,登録できない" do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Input full-width Katakana characters.")
      end


      it "Fist name kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank" )
      end

      it "Fist name kanaが全角文字（カタカナ）で入力しない場合,登録できない" do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Input full-width Katakana characters.")
      end

      it "Date birthが空では登録できない" do
        @user.date_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date birth can't be blank")
      end
    end
  end
end
