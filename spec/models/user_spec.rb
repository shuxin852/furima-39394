require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordは数字のみでは登録できない' do
      end
      it 'passwordは英字のみでは登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'family_nameが空では登録できない' do
      end
      it 'family_nameが半角文字では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'last_nameが半角文字では登録できない' do
      end
      it 'family_name_kanaが空では登録できない' do
      end
      it 'family_name_kanaがカタカナ以外では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
      end
      it 'birth_dayが空では登録できない' do
      end
    end
  end
end
