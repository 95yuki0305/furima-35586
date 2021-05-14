require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_ruby,first_name_ruby,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていると登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordはpasswordとpassword_confirmationを入力し、半角英数字が混同して、6文字以上という内容が一致していれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'family_nameは全角(漢字)で入力すると登録できる' do
        @user.family_name = '佐藤'
        expect(@user).to be_valid
      end
      it 'family_nameは全角(ひらがな)で入力すると登録できる' do
        @user.family_name = 'さとう'
        expect(@user).to be_valid
      end
      it 'family_nameは全角(カタカナ)で入力すると登録できる' do
        @user.family_name = 'サトウ'
        expect(@user).to be_valid
      end
      it 'first_nameは全角(漢字)で入力すると登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'first_nameは全角(ひらがな)で入力すると登録できる' do
        @user.first_name = 'たろう'
        expect(@user).to be_valid
      end
      it 'first_nameは全角(カタカナ)で入力すると登録できる' do
        @user.first_name = 'タロウ'
        expect(@user).to be_valid
      end
      it 'family_name_rubyは全角(カタカナ)で入力すると登録できる' do
        @user.family_name_ruby = 'サトウ'
        expect(@user).to be_valid
      end
      it 'first_name_rubyは全角(カタカナ)で入力すると登録できる' do
        @user.first_name_ruby = 'タロウ'
        expect(@user).to be_valid
      end
      it 'birthdayは生年月日を入力すると登録できる' do
        @user.birthday = "1930-01-01"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it '重複したemailが存在する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation is invalid")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameは全角(漢字・ひらがな・カタカナ)以外で入力すると登録できない' do
        @user.family_name = 'Sato'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角(漢字・ひらがな・カタカナ)以外で入力すると登録できない' do
        @user.first_name = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'family_name_rubyが空では登録できない' do
        @user.family_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
      end
      it 'family_name_rubyは全角(漢字)で入力すると登録できない' do
        @user.family_name_ruby = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby is invalid")
      end
      it 'family_name_rubyは全角(ひらがな)で入力すると登録できない' do
        @user.family_name_ruby = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby is invalid")
      end
      it 'family_name_rubyは全角(英字)で入力すると登録できない' do
        @user.family_name_ruby = 'Sato'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby is invalid")
      end
      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it 'first_name_rubyは全角(漢字)で入力すると登録できない' do
        @user.first_name_ruby = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it 'first_name_rubyは全角(ひらがな)で入力すると登録できない' do
        @user.first_name_ruby = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it 'first_name_rubyは全角(英字)で入力すると登録できない' do
        @user.first_name_ruby = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end