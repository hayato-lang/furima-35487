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

      it '商品画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが1では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが1では保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'fee_idが1では保存できないこと' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end

      it 'prefecture_idが1では保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'shipping_day_idが1では保存できないこと' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it '販売価格が空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が、¥300以下では保存できないこと' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が、¥9,999,999以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '販売価格は半角英数混合では登録できないこと' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格は半角英語だけでは登録できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
