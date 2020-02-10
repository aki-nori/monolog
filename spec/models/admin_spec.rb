require 'rails_helper'

RSpec.describe Admin, type: :model do

  describe 'admin登録' do
    context '名前とメールアドレスがあるとき' do
      it '登録できる' do
        expect(FactoryBot.create(:admin)).to be_valid
      end
    end

      context '名前がないとき' do
        it '登録できない' do
          expect(FactoryBot.build(:admin, name: '')).to_not be_valid
        end
      end

    context 'メールアドレスがないとき' do
      it '登録できない' do
        expect(FactoryBot.build(:admin, email: '')).to_not be_valid
      end
    end

    context '他のユーザとメールアドレスが重複しているとき' do
      it '登録できない' do
        user1 = FactoryBot.create(:admin, name: 'admin1', email: 'admin@sample.com')
        expect(FactoryBot.build(:admin, name: 'admin2', email: 'admin@sample.com')).to_not be_valid
      end
    end

    context 'パスワードがないとき' do
      it '登録できない' do
        expect(FactoryBot.build(:admin, password: '')).to_not be_valid
      end
    end
  end

end
