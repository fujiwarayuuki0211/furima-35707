require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品の出品' do
    context '商品が出品できる時' do
      it 'すべての情報が正しければ登録できる' do
        expect(@item).to be_valid
      end      
      it '商品画像があれば、出品できる' do
        @item.image = fixture_file_upload('app/assets/images/star.png')
        expect(@item).to be_valid
      end
      it '商品名があれば、出品できる' do
        @item.name = 'aaaaaa'
        expect(@item).to be_valid
      end
      it '商品説明があれば、出品できる' do
        @item.description = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'category_idが1以外のとき、出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'status_idが1以外のとき、出品できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'burden_idが1以外のとき、出品できる' do
        @item.burden_id = 2
        expect(@item).to be_valid
      end
      it 'area_idが1以外のとき、出品できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'day_idが1以外のとき、出品できる' do
        @item.day_id = 2
        expect(@item).to be_valid
      end
      it '販売価格があれば、出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格が半角数字であれば、出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '販売価格が￥300〜￥9,999,999なら、出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it '商品画像が空だと、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと、出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと、出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'burden_idが1だと出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'area_idが1だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'day_idが1だと出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it '販売価格が空だと、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字ではないと、出品できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が英数混合では、出品できない' do
        @item.price = '1ooo'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が半角英語のみでは、出品できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が￥300以上ではないと、出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が￥9,999,999以下ではないと、出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
