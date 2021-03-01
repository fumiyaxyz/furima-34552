require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入'  do
    context  '商品の購入ができる時' do
      it  '全ての情報が正しければ購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_address.building_number=''
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it '郵便番号がないと購入できない'  do
        @order_address.postal_code=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '都道府県がないと購入できない'  do
        @order_address.prefecture_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'カテゴリーのidが１を選択されていると投稿できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it '市区町村がないと購入できない'  do
        @order_address.city=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")    
      end
      it '番地がないと購入できない'  do
        @order_address.house_number=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号がないと購入できない'  do
        @order_address.phone_number=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '郵便番号にはハイフンがないと購入できない'  do
        @order_address.postal_code='2321111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '電話番号は11桁以内出ないとと購入できない'  do
        @order_address.phone_number='111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が英数混合だと購入できない'  do
        @order_address.phone_number='11111aaaa1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tokenが空では保存できない' do
        @order_address.token=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが空では購入できない'  do
        @order_address.user_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できない'  do
        @order_address.item_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
