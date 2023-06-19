require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it 'すべての項目が存在すれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'post_codeが空では購入できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが「3桁ハイフン4桁」でないと購入できない' do
        @order_form.post_code = '1234-123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @order_form.post_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが数値でないと購入できない' do
        @order_form.post_code = "abc-defg"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角では購入できない' do
        @order_form.post_code = "１２３-４５６７"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空では購入できない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @order_form.municipalities = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数値でないと購入できない' do
        @order_form.phone_number = 'abcdefghrj'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Phone number should be 10-11 digits")
      end
      it 'phone_numberは10桁以上11桁以内でないと購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Phone number should be 10-11 digits")
      end
      it 'phone_numberが全角では購入できない' do
        @order_form.phone_number = '１２３１２３１２３４'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Phone number should be 10-11 digits")
      end
    end
  end
end

