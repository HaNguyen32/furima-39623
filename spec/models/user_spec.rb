require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_nameとemail,passwordとencrypted_password,first_nameとlast_name,katagana_first_nameとkatagana_last_name,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nick_nameが空では登録できない" do
        @user.nick_name = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it "First nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank" )
      end

      it "First nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "Last nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank" )
      end

      it "Last nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it "Katagata first nameが空では登録できない" do
        @user.katagana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katagana first name can't be blank" )
      end

      it "Katagata first nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.katagana_first_name = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Katagana first name is invalid. Input full-width characters.")
      end


      it "Katagana last nameが空では登録できない" do
        @user.katagana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katagana last name can't be blank" )
      end

      it "Katagana last nameが全角文字（ひらがな・カタカナ・漢字）で入力しない場合,登録できない" do
        @user.katagana_last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Katagana last name is invalid. Input full-width characters.")
      end

      it "Date of birthが空では登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
