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
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県がないと購入できない'  do
        @order_address.prefecture_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'カテゴリーのidが１を選択されていると投稿できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村がないと購入できない'  do
        @order_address.city=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")    
      end
      it '番地がないと購入できない'  do
        @order_address.house_number=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がないと購入できない'  do
        @order_address.phone_number=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にはハイフンがないと購入できない'  do
        @order_address.postal_code='2321111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '電話番号は11桁以内出ないとと購入できない'  do
        @order_address.phone_number='111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が英数混合だと購入できない'  do
        @order_address.phone_number='11111aaaa1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @order_address.token=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない'  do
        @order_address.user_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない'  do
        @order_address.item_id=''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
