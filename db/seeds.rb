# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = :ja
random = Random.new

# ダミーデータ数設定
create_user = 50
create_item = 100
create_log = 300
create_comment = 500

# カテゴリデータ
cats = ['スマートフォン', 'PC', 'タブレット', 'チャージャー', 'カメラ', 'イヤホン', 'スピーカー', 'ドローン', '日用品', '車', 'トラベル', 'スマートウォッチ', 'ストレージ']
cats.each do |category|
    Category.create!(name: category)
end

puts "Created Categories data. #{Category.count}"

# Adminデータ
Admin.create!(
  [
    {
      email: 'admin@admin',
      name: 'Test Admin',
      password: 'adminadmin'
    }
  ]
)

puts "Created Admins data. #{Admin.count}"

# ユーザデータ
addreses = ['東京都新宿区', '神奈川県藤沢市', '神奈川県横浜市', '大阪府大阪市', '東京都世田谷区', '台湾台北市', '東京都渋谷区']
addreses.each_with_index do |add, i|
  i += 1
  User.create!(
    email: "#{i}#{i}#{i}@#{i}#{i}#{i}",
    password: "#{i}#{i}#{i}#{i}#{i}#{i}",
    name: "テストユーザー#{i}",
    introduction: "わたしはテストユーザ#{i}です。システムのテスト用に作られたアカウントです。よろしくおねがいします。",
    address: add,
    twitter_account: 'https://twitter.com/',
    instagram_account: 'https://instagram.com/',
    facebook_account: 'https://www.facebook.com/',
    profile_image: File.open("./public/img-user-#{"%#002d" % i }.jpg")
  )
end

create_user.times do
  img_num = random.rand(20..30)
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    name: Faker::Name.name,
    introduction: '私は一番同時にどんな批評方というののところがなっんです。とこう時分へ演説通りもとうていその指図ありただけをしとしまったへは指図ありあわせないあっば、こうとは過ぎないないなくっまし。自力を載せでしのは何しろ偶然ではたしてなんなけれ。',
    address: Faker::Address.state,
    twitter_account: 'https://twitter.com/',
    instagram_account: 'https://instagram.com/',
    facebook_account: 'https://www.facebook.com/',
    profile_image: File.open("./public/img-user-#{"%#002d" % img_num }.jpg")
  )
end

puts "Created Users data. #{User.count}"

user_count = User.count

Item.create!(
  [
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('タブレット') + 1,
      name: 'iPad Pro 10.5インチ',
      maker: 'Apple',
      infomation: '高性能iPad。型落ちだけどコスパGood！',
      place: 'アップルストア表参道',
      price: '80000',
      score: '4.0',
      external_page: 'https://www.apple.com/jp/shop/product/FQDT2J/A/105%E3%82%A4%E3%83%B3%E3%83%81iPad-Pro-Wi-Fi-64GB-%E3%82%B9%E3%83%9A%E3%83%BC%E3%82%B9%E3%82%B0%E3%83%AC%E3%82%A4-%E6%95%B4%E5%82%99%E6%B8%88%E8%A3%BD%E5%93%81',
      image: File.open("./public/img-item-01.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('イヤホン') + 1,
      name: 'Air Pods Pro',
      maker: 'Apple',
      infomation: 'Appleの完全ワイヤレスイヤホン！ノイズキャンセルがものすごく良く効く！',
      place: 'Apple表参道',
      price: '30000',
      score: '5.0',
      external_page: 'https://www.apple.com/jp/airpods-pro/',
      image: File.open("./public/img-item-02.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('スマートフォン') + 1,
      name: 'iPhone 11 Pro',
      maker: 'Apple',
      infomation: 'iPhone初の3眼カメラ搭載。通称タピオカメラ。',
      place: 'Apple store',
      price: '130000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-03.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('PC') + 1,
      name: 'Raspberry Pi',
      maker: 'Raspberry Pi Foundation',
      infomation: 'シングルボードコンピュータ。',
      place: 'amazon',
      price: '6000',
      score: '3.0',
      external_page: 'https://ja.wikipedia.org/wiki/Raspberry_Pi',
      image: File.open("./public/img-item-04.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('チャージャー') + 1,
      name: 'PowerCore Fusion',
      maker: 'Anker',
      infomation: 'チャージャーとモバイルバッテリーが一体になっているので便利',
      place: 'test3place',
      price: '2500',
      score: '4.0',
      external_page: 'https://www.amazon.co.jp/Anker-PowerCore-%E3%83%A2%E3%83%90%E3%82%A4%E3%83%AB%E3%83%90%E3%83%83%E3%83%86%E3%83%AA%E3%83%BC%E6%90%AD%E8%BC%89-%E3%80%90PowerIQ%E6%90%AD%E8%BC%89-iPhone%E3%80%81iPad%E3%80%81Android%E5%90%84%E7%A8%AE%E5%AF%BE%E5%BF%9C/dp/B01LATWL5G/ref=asc_df_B01LATWL5G/?tag=jpgo-22&linkCode=df0&hvadid=218104193722&hvpos=&hvnetw=g&hvrand=5448566743754137039&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1009333&hvtargid=pla-438962133496&psc=1',
      image: File.open("./public/img-item-05.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('スマートウォッチ') + 1,
      name: 'Apple Watch',
      maker: 'Apple',
      infomation: 'スケジュールや通知の確認に便利',
      place: 'Apple Store',
      price: '60000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-06.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('PC') + 1,
      name: 'MacBookPro15',
      maker: 'apple',
      infomation: '高機能ラップトップ',
      place: 'AppleStore',
      price: '200000',
      score: '5.0',
      external_page: 'https://www.apple.com/jp/macbook-pro/',
      image: File.open("./public/img-item-07.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('ドローン') + 1,
      name: 'MavicPro',
      maker: 'dji',
      infomation: '民生用ドローンの高性能機',
      place: 'ヨドバシカメラ',
      price: '150000',
      score: '4.0',
      external_page: 'https://www.dji.com/jp/mavic',
      image: File.open("./public/img-item-08.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('カメラ') + 1,
      name: 'k-1',
      maker: 'pentax',
      infomation: 'フルサイズ一眼レフ',
      place: 'ビックカメラ',
      price: '200000',
      score: '3.0',
      external_page: '',
      image: File.open("./public/img-item-09.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('スピーカー') + 1,
      name: 'AmazonEcho',
      maker: 'amazon',
      infomation: '便利なスマートスピーカー',
      place: 'amazon',
      price: '5000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-10.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('ストレージ') + 1,
      name: 'SandiskSSD',
      maker: 'sandisk',
      infomation: '外部接続式のポータブルSSD。容量は1TB',
      place: 'amazon',
      price: '12000',
      score: '5.0',
      external_page: '',
      image: File.open("./public/img-item-11.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('トラベル') + 1,
      name: '変圧器',
      maker: '',
      infomation: '海外旅行のおとも',
      place: 'amazon',
      price: '2000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-12.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('スマートフォン') + 1,
      name: 'ワイコン',
      maker: '',
      infomation: '普通のスマートフォンでも超広角で撮れる',
      place: 'amazon',
      price: '1000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-13.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('イヤホン') + 1,
      name: 'ヘッドホン',
      maker: '',
      infomation: '赤い色のすてきな、遮音性の高いヘッドホン',
      place: 'amazon',
      price: '15000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-14.jpg")
    },
    {
      user_id: random.rand(1..user_count),
      category_id: cats.index('チャージャー') + 1,
      name: 'usb-c充電器',
      maker: 'apple',
      infomation: '18Wで高速に充電できる',
      place: 'apple',
      price: '3000',
      score: '4.0',
      external_page: '',
      image: File.open("./public/img-item-15.jpg")
    }
  ]
)

# アイテムデータ
cat_count = cats.count
create_item.times do
  img_num = random.rand(20..25)
  Item.create!(
    {
      user_id: random.rand(1..user_count),
      category_id: random.rand(1..cat_count),
      name: Faker::Food.sushi,
      maker: Faker::Company.name,
      infomation: Faker::Lorem.sentence,
      place: Faker::Coffee.country,
      price: random.rand(300..10000),
      score: random.rand(1..5),
      external_page: '',
      image: File.open("./public/img-item-#{img_num}.jpg")
    }
  )
end

puts "Created Items data. #{Item.count}"

# アイテム登録と同時にシステムが最初のログの投稿を行う
items = Item.all
items.each do |item|
  img_num = random.rand(1..20)
  Log.create!(
    item_id: item.id,
    title: "#{item.name} を登録しました",
    body: 'これからこのガジェットのログを残していきましょう。',
    from: :system
  )
end

# ログデータ
item_count = Item.count
create_log.times do
  img_num = random.rand(1..20)
  case random.rand(1..5)
  when 1 then
    title = 'すごく使い勝手がいいですよ！'
  when 2 then
    title = 'みなさんにお勧めします！'
  when 3 then
    title = 'コストパフォーマンスが素晴らしい！'
  when 4 then
    title = 'とても便利です！'
  when 5 then
    title = '毎日使っています！'
  end

  Log.create!(
    item_id: random.rand(1..item_count),
    title: title,
    body: 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。',
    from: :user,
    image: File.open("./public/img-log-#{"%#002d" % img_num }.jpg")
  )
end


puts "Created Logs data. #{Log.count}"


# コメントデータ
log_count = Log.count
create_comment.times do

  log_id = random.rand(1..log_count)
  user_id = random.rand(1..user_count)
  body = ''

  if Log.find(log_id).item.user.id == user_id
    body = 'おすすめですよ！'
  else
    case random.rand(1..5)
    when 1 then
      body = 'いいですね！'
    when 2 then
      body = 'わたしも買いました！'
    when 3 then
      body = 'ほしい！'
    when 4 then
      body = '買います！'
    when 5 then
      body = 'とても良さそうですね。'
    end
  end

  Comment.create!(
    log_id: log_id,
    user_id: user_id,
    body: body
  )
end

puts "Created Comments data. #{Comment.count}"

# いいねデータ
item_count = Item.count
User.all.each do |user|
  like_target = []
  item_count.times do
    like_target << random.rand(1..item_count)
  end
  like_target = like_target.uniq
  like_target.each do |target|
    Like.create!(
      user_id: user.id,
      item_id: target
    )
  end
end

puts "Created Likes data. #{Like.count}"

# フォローデータ
User.all.each do |user|
  follow_target = []
    user_count.times do
      follow_target << random.rand(1..user_count - 1)
    end
  follow_target = follow_target.uniq
  follow_target.delete(user.id)

  follow_target.each do |target|
    Relationship.create!(
      following_id: target,
      follower_id: user.id
    )
  end
end

puts "Created Follows data. #{Relationship.count}"