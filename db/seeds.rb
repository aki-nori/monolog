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

Admin.create!(
  [
    {
      email: 'aaa@aaa',
      name: 'Test Admin',
      password: 'aaaaaa'
    }
  ]
)

User.create!(
  [
    {
      email: '111@111',
      password: '111111',
      name: 'Test User1',
      introduction: 'Im TestItem1!! dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text',
      address: 'my place1'
    },
    {
      email: '222@222',
  	  password: '222222',
  	  name: 'Test User2',
      introduction: 'Im TestItem2!! dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text',
      address: 'my place2'
    },
    {
      email: '333@333',
      password: '333333',
      name: 'Test User3',
      introduction: 'Im TestItem3!! dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text dummy text',
      address: 'my place3'
    }
  ]
)

Item.create!(
  [
    {
      user_id: 1,
      category_id: 1,
      name: 'TestItem1',
      infomation: 'Item1s Info Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
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
    }
  ]
)