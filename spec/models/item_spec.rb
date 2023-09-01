require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品登録' do
    context '新規商品登録できる場合'do
      it 'trade_name,description,category_id,condition_id,postage_id,prefecture_id,date_id,price,imageが存在すれば商品登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規商品登録できない場合' do
      it 'trade_nameが空では登録できない。' do
        @item.trade_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Trade name can't be blank")
      end

      it 'descriptionが空では登録できない。' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが選択されていないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'postage_idが選択されていないと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it 'prefecture_idが選択されていないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'date_idが選択されていないと登録できない' do
        @item.date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Date must be other than 1")
      end

      it 'priceが空では登録できない。' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'image空では登録できない。' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end

end
