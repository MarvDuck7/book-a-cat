require 'faker'

puts 'Destroying current bookings database...'
Booking.destroy_all
puts 'Destroying current cats database...'
Cat.destroy_all
puts 'Destroying current users database...'
User.destroy_all

cities = [
  '33000 Bordeaux',
  '75001 Paris',
  '13001 Marseille',
  '31000 Toulouse',
  '69001 Lyon',
  '54000 Nancy',
  '57000 Strasbourg',
  '44000 Nantes',
  '59000 Lille',
  '21000 Brest',
  '34000 Montpellier'
]

streets = [
  'Rue Victor Hugo',
  'Rue de l\'Eglise',
  'Rue de la mairie',
  'Place de la mairie',
  'Place de l\'Eglise',
  'Grande rue',
  'Rue de la gare',
  'Rue des écoles',
  'Rue principale',
  'Rue du moulin',
  'Rue Pasteur',
  'Rue du stade',
  'Rue du château',
  'Rue de la fontaine',
  'Rue des jardins'
]

cats_pictures_urls = [
  'v1494928644/cat_1_lcdl8w.jpg',
  'v1494928644/cat_2_euuf34.jpg',
  'v1494928643/cat_3_yeioxl.jpg',
  'v1494928643/cat_4_nfxdhe.jpg',
  'v1494928650/cat_5_ezdqoz.jpg',
  'v1494928645/cat_6_o1xlfc.jpg',
  'v1494928653/cat_7_zshq0o.jpg',
  'v1494928651/cat_8_onzosc.jpg',
  'v1494928649/cat_9_k8og65.jpg',
  'v1494928648/cat_10_ljbynk.jpg',
  'v1494928650/cat_11_ilg3st.jpg',
  'v1494928651/cat_12_zgqqcb.jpg',
  'v1494928661/cat_13_e7v74k.jpg',
  'v1494928652/cat_14_vg7hzy.jpg',
  'v1494928653/cat_15_eofzph.jpg',
  'v1494928657/cat_16_fqt4dz.jpg',
  'v1494928656/cat_17_lkvjpi.jpg',
  'v1494928664/cat_18_b6ch5t.jpg',
  'v1494928656/cat_19_uku9xz.jpg',
  'v1494928665/cat_20_kc5s6i.jpg',
  'v1494928660/cat_21_dvldto.jpg',
  'v1494928664/cat_22_jjtqbz.jpg',
  'v1494928662/cat_23_d6jdho.jpg',
  'v1494928667/cat_24_kf3vpt.jpg',
  'v1494928665/cat_25_uqpaan.jpg',
  'v1494928669/cat_26_ktu470.jpg',
  'v1494928668/cat_27_gph48d.jpg',
  'v1494928678/cat_28_fhveis.jpg',
  'v1494928671/cat_29_jd9dod.jpg',
  'v1494928678/cat_30_izoyux.jpg',
  'v1494928676/cat_31_ph9grt.jpg',
  'v1494928679/cat_32_u33riz.jpg',
  'v1494928675/cat_33_ggs8u2.jpg',
  'v1494928675/cat_34_slkjfa.jpg',
  'v1494928684/cat_35_dbesbg.jpg',
  'v1494928678/cat_36_dmqmml.jpg',
  'v1494928680/cat_37_tbr534.jpg',
  'v1494928683/cat_38_t6hpcu.jpg',
  'v1494928684/cat_39_hw2wlx.jpg',
  'v1494928687/cat_40_waqeux.jpg'
]

reviews = [
  {
    content: 'I spent a wonderful weekend',
    rating: 5
  },
  {
    content: 'This bastard shit on my carpet',
    rating: 1
  },
  {
    content: 'This cat rocks',
    rating: 4
  },
  {
    content: 'Soooo sweet',
    rating: 5
  },
  {
    content: 'He sucks at playing fifa',
    rating: 2
  },
  {
    content: 'I already miss him',
    rating: 4
  },
  {
    content: 'Just the perfect cat',
    rating: 5
  },
  {
    content: 'A true mouse killer',
    rating: 4
  },
  {
    content: 'Thank you so much Rent A Cat',
    rating: 4
  }
]

puts 'Start seeding users...'
30.times do
  user = User.new(
    username: Faker::LordOfTheRings.character,
    email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com",
    password: Faker::StarWars.specie
  )
  user.save
  puts "> #{user.username} created"
end

print 'Start seeding cats...'
cats_pictures_urls.each do |cat_picture_url|
  cat = Cat.new(
    name: Faker::Cat.name,
    description: Faker::Cat.breed,
    address: rand(1..10).to_s + ' ' + streets.sample + ' ' + cities.sample,
    price: rand(30..80)
  )
  cat.user = User.all.order('RANDOM()').first
  cat.save
  url = 'http://res.cloudinary.com/zank94/image/upload/c_scale,w_1920/'
  url += cat_picture_url
  cat.photo_url = url
  puts "> #{cat.name} created"
end

puts 'Start seeding bookings...'
10.times do
  review = reviews.sample
  booking = Booking.new(
    book_date: Date.today - rand(1..500),
    review_content: review[:content],
    review_rating: review[:rating]
  )
  booking.cat = Cat.all.order('RANDOM()').first
  booking.user = User.all.order('RANDOM()').first
  booking.save
  print "Booking added with #{booking.user.username} and #{booking.cat.name}."
end
