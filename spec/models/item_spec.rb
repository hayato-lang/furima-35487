require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image, name, description, category_id, status_id, fee_id, prefecture_id, shipping_day_id, priceが存在していれば保存できること' do
        expect(@item).to be_valid
      end

      it '販売価格は、¥300~¥9,999,999の間であれば保存できること' do
        @item.price = 48_231
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'status_idが空では保存できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end

      it 'fee_idが空では保存できないこと' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee is not a number')
      end

      it 'prefecture_idが空では保存できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'shipping_day_idが空では保存できないこと' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a number')
      end

      it 'priceが空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が、¥300以下では保存できないこと' do
        @item.price = '20'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が、¥9,999,999以上では保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格は全角数字では保存できないこと' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
