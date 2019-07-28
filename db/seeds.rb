# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#user
[
  ['test1@test.com', '111111', '太郎', '田中', 'たろう', 'たなか', '111-1111', '東京', '111-1111-1111'],
  ['test2@test.com', '222222', '知弥', '高良', 'ともや', 'たから', '222-2222', '沖縄', '222-2222-2222'],
  ['test3@test.com', '333333', '剛', '宮下', 'つよし', 'みやした', '333-3333', '霊界', '333-3333-3333'],
  ['test4@test.com', '444444', '陽介', '大葉', 'ようすけ', 'おおば', '444-4444', '岩手', '444-4444-4444'],
  ['test5@test.com', '555555', '幸一', '大阪', 'こういち', 'おおさか', '555-5555', '鹿児島', '555-5555-5555'],
  ['test6@test.com', '666666', '正弘', '花輪', 'まさひろ', 'はなわ', '666-6666', '埼玉', '666-6666-6666'],
  ['test7@test.com', '777777', '雅也', '上谷', 'まさや', 'うえたに', '777-7777', '京都', '777-7777-7777'],
  ['test8@test.com', '888888', '哲二', '穴吹', 'てつじ', 'あなぶき', '888-8888', '香川', '888-8888-8888'],
  ['test9@test.com', '999999', '高雄', '佐藤', 'たかお', 'さとう', '999-9999', '山形', '999-9999-9999'],
  ['test10@test.com', '121212', '智也', '笹生', 'ともや', 'さそう', '121-1212', '群馬', '121-1212-1212'],
  ['test11@test.com', '131313', '秀一郎', '八十島', 'しゅういちろう', 'やそしま', '131-1313', '新潟', '131-1313-1313'],
  ['test12@test.com', '141414', '健介', '永', 'けんすけ', 'なが', '141-1414', '長野', '141-1414-1414'],
  ['test13@test.com', '151515', '直弘', '白倉', 'なおひろ', 'しろくら', '151-1515', '福井', '151-1515-1515'],
  ['test14@test.com', '161616', '鑑三', '阿部', 'かんぞう', 'あべ', '161-1616', '北海道', '161-1616-1616']
].each do |mail, pass, name_f, name_l, name_f_1, name_l_1, post, add, num|
  User.create!(
    { email: mail, password: pass, name_first: name_f, name_last: name_l, name_first_phonetic: name_f_1,
    	name_last_phonetic: name_l_1, post_code: post, address: add, phone: num }
  )
end

#artist
[
  "安室奈美恵",
  "あいみょん",
  "米津玄師",
  "ドレイク",
  "エミネム",
  "スヌープドッグ",
  "ONE OK ROCK",
  "MAN WITH A MISSION",
  "BUMP OF CHICKEN",
  "ブルーノ・マーズ",
  "エド・シーラン",
  "マイケル・ジャクソン",
  "TWICE",
  "防弾少年団",
  "東方神起"
].each do |name|
  Artist.create!(
    { name: name }
  )
end

#label
[
  "ワーナーミュージック ジャパン",
  "Sony Music Japan International(SMJI)",
  "JYPエンターテインメント",
  "ユニバーサルミュージック",
  "エイベックス・グループ",
  "キングレコード"
].each do |name|
  Label.create!(
    { name: name }
  )
end

#genre
[
  "J-POP",
  "ヒップホップ",
  "ROCK",
  "R&B",
  "K-POP",
  "その他"
].each do |name|
  Genre.create!(
    { name: name }
  )
end

#admin
[
  ["john", "john@amason.com", "amasonjohn"],
  ["jack", "jack@amason.com", "amasonjack"],
  ["tom", "tom@amason.com", "amasontom"],
  ["chris", "chris@amason.com", "amasonchris"]
].each do |name, mail, pass|
  Admin.create!(
    { name: name, email: mail, password: pass  }
  )
end




