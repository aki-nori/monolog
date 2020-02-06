# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# カテゴリのテストデータ
cats = ['充電器', 'ケーブル', 'スマホ', 'PC', 'タブレット', 'オーディオ', '車']
cats.each do |category|
    Category.create!(name: category)
end

# Adminの作成
Admin.create!(
  [
    {
      email: 'aaa@aaa',
      name: 'Test Admin',
      password: 'aaaaaa'
    }
  ]
)

# ユーザデータの作成
addreses = ['東京都新宿区', '神奈川県藤沢市', '神奈川県横浜市', '大阪府大阪市', '東京都世田谷区', '台湾台北市', '東京都渋谷区']
addreses.each_with_index do |add, i|
  User.create(
      email: "#{i}#{i}#{i}@#{i}#{i}#{i}",
      password: "#{i}#{i}#{i}#{i}#{i}#{i}",
      name: "テストユーザ#{i}",
      introduction: "わたしはテストユーザ#{i}です。システムのテスト用に作られたアカウントです。よろしくおねがいします。",
      address: add

    )
end

Item.create!(
  [
    {
      user_id: 1,
      category_id: 1,
      name: 'TestItem1',
      infomation: 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れ',
      place: 'test1place',
      price: '300',
      score: '2.0', 
    },
    {
      user_id: 1,
      category_id: 2,
      name: 'TestItem2',
      infomation: 'Item2s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test2place',
      price: '1000',
      score: '4.0'
    },
    {
      user_id: 2,
      category_id: 3,
      name: 'TestItem3',
      infomation: 'Item3s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test3place',
      price: '100',
      score: '3.0'
    },
    {
      user_id: 2,
      category_id: 2,
      name: 'TestItem4',
      infomation: 'Item4s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test3place',
      price: '1000',
      score: '5.0'
    },
    {
      user_id: 2,
      category_id: 2,
      name: 'TestItem5',
      infomation: 'Item5s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test3place',
      price: '1000',
      score: '5.0'
    },
    {
      user_id: 2,
      category_id: 2,
      name: 'TestItem6',
      infomation: 'Item6s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test3place',
      price: '1000',
      score: '5.0'
    },
    {
      user_id: 3,
      category_id: 5,
      name: 'TestItem7',
      infomation: 'Item7s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      place: 'test3place',
      price: '1000',
      score: '5.0'
    }
  ]
)