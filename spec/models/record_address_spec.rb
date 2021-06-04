require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '情報が保存できる場合' do
      it '全ての値が正しく入力されれば保存できる' do
        expect(@record_address).to be_valid
      end
      it '建物名は空でも保存できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '情報が保存できない場合' do
      it 'tokenが空だと保存できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれないと保存できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1だと保存できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村が空だと保存できない' do
        @record_address.municipality = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上だと保存できない' do
        @record_address.phone_number = '012345678910'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号が数値ではないと保存できない' do
        @record_address.phone_number = 'あああああああ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
