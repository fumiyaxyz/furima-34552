require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる時' do
      it '全ての情報が正しければ投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない時' do
      it '商品画像が空だと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと投稿できない'  do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が空だと投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーのidが１を選択されていると投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が空だと投稿できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の状態のidが１を選択されていると投稿できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担が空だと投稿できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '配送料の負担のidが１を選択されていると投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域が空だと投稿できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域のidが１を選択されていると投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が空だと投稿できない' do
        @item.ship_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship days can't be blank")
      end
      it '発送までの日数のidが１を選択されていると投稿できない' do
        @item.ship_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship days must be other than 1')
      end
      it '販売価格が空だと投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は300円以上でないと投稿できない' do
        @item.price = 99
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '販売価格は10000000円以下でないと投稿できない' do
        @item.price = 5_555_555_555_555_555
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '販売価格は半角数字のみでないと投稿できない' do
        @item.price = '8888fff'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
