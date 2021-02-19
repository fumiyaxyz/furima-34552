require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'user@example.com'
      expect(@user).to be_valid
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'aaaaaaa666'
      @user.valid?
    end
    it 'パスワードは、半角英数字混合での入力がないと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）は、値が違うと登録できない'  do
      another_user = FactoryBot.build(:user)
      @user.password = another_user.password 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名の名字が空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it 'ユーザー本名の名前が空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name_kanji = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
    end
    it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name_kanji = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it 'ユーザー本名のふりがなの名字が空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー本名のふりがなの名前が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do

    end
    it 'ユーザー本名の名字のフリガナは、カタカナでなければ登録できない' do
      @user.last_name_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'ユーザー本名の名前のフリガナは、カタカナでなければ登録できない' do
      @user.first_name_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it '生年月日が必須であること' do
      @user.birthday=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    
  end
end
