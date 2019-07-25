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
  ['test3@test.com', '333333', '神', '犬', 'がみ', 'いぬ', '333-3333', '霊界', '333-3333-3333'],
  ['test4@test.com', '444444', '足', '頭', 'あし', 'あたま', '444-4444', '体', '444-4444-4444']
].each do |mail, pass, name_f, name_l, name_f_1, name_l_1, post, add, num|
  User.create!(
    { email: mail, password: pass, name_first: name_f, name_last: name_l, name_first_phonetic: name_f_1,
    	name_last_phonetic: name_l_1, post_code: post, address: add, phone: num }
  )
end

#artist
[
  "Takara"
].each do |name|
  Artist.create!(
    { name: name }
  )
end

#label
[
  "Takara_comp"
].each do |name|
  Label.create!(
    { name: name }
  )
end

#genre
[
  "J-POP"
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




