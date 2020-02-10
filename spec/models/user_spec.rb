require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザ登録' do
    context '名前とメールアドレスがあるとき' do
      it '登録できる' do
        expect(FactoryBot.create(:user)).to be_valid
      end
    end

      context '名前がないとき' do
        it '登録できない' do
          expect(FactoryBot.build(:user, name: '')).to_not be_valid
        end
      end

      context '名前が16文字のとき' do
        it '登録できない' do
          expect(FactoryBot.build(:user, name: Faker::Lorem.characters(number: 16))).to_not be_valid
        end
      end

    context '名前が15文字のとき' do
      it '登録できる' do
        expect(FactoryBot.build(:user, name: Faker::Lorem.characters(number: 15))).to be_valid
      end
    end

    context 'メールアドレスがないとき' do
      it '登録できない' do
        expect(FactoryBot.build(:user, email: '')).to_not be_valid
      end
    end

    context '他のユーザとメールアドレスが重複しているとき' do
      it '登録できない' do
        user1 = FactoryBot.create(:user, name: 'user1', email: 'user1@sample.com')
        expect(FactoryBot.build(:user, name: 'user2', email: 'user1@sample.com')).to_not be_valid
      end
    end

    context 'パスワードがないとき' do
      it '登録できない' do
        expect(FactoryBot.build(:user, password: '')).to_not be_valid
      end
    end

    context 'パスワードが5文字のとき' do
      it '登録できない' do
        expect(FactoryBot.build(:user, password: Faker::Lorem.characters(number: 5))).to_not be_valid
      end
    end

    context '自己紹介が151文字のとき' do
      it '登録できない' do
        expect(FactoryBot.build(:user, introduction: Faker::Lorem.characters(number: 151))).to_not be_valid
      end
    end

    context '自己紹介が150文字のとき' do
      it '登録できる' do
        expect(FactoryBot.build(:user, introduction: Faker::Lorem.characters(number: 150))).to be_valid
      end
    end
  end
end
