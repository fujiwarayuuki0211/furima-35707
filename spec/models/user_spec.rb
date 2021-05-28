require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    
    context '新規登録できる場合' do
      it 'ニックネームが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスに＠が存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上であれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードに半角英数字が含まれていたら、登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワード（確認用）が存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワード（確認用）がパスワードと一致すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字が存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前が存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字が全角ならば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前が全角ならば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字のフリガナが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前のフリガナが存在すれば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字のフリガナが全角カタカナならば、登録できる' do
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前のフリガナが全角カタカナならば、登録できる' do
        expect(@user).to be_valid
      end
      it '生年月日が存在すれば、登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠がないと登録できない' do
        @user.email = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英語のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数字のみだと登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワード確認用はパスワードと一致しないと登録できない' do
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名の名前が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは半角だと登録できない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_nameは半角だと登録できない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end    
      it 'ユーザー本名のフリガナは、名字が空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'ユーザー本名の名字のフリガナは全角かつカタカナでないと登録できない' do
        @user.kana_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'ユーザー本名の名前のフリガナは全角かつカタカナでないと登録できない' do
        @user.kana_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end
      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
