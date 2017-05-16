require "faker"

puts "Destroying current cats database..."

Cat.destroy_all

puts "Destroying current users database..."

User.destroy_all

puts "Destroying current bookings database..."

Booking.destroy_all

CITIES = %w(Bordeaux Lyon Paris Marseille)
CATS_PICTURES_URLS = %w(v1494928644/cat_1_lcdl8w.jpg v1494928644/cat_2_euuf34.jpg v1494928643/cat_3_yeioxl.jpg
                   v1494928643/cat_4_nfxdhe.jpg v1494928650/cat_5_ezdqoz.jpg v1494928645/cat_6_o1xlfc.jpg
                   v1494928653/cat_7_zshq0o.jpg v1494928651/cat_8_onzosc.jpg v1494928649/cat_9_k8og65.jpg
                   v1494928648/cat_10_ljbynk.jpg v1494928650/cat_11_ilg3st.jpg v1494928651/cat_12_zgqqcb.jpg
                   v1494928661/cat_13_e7v74k.jpg v1494928652/cat_14_vg7hzy.jpg v1494928653/cat_15_eofzph.jpg
                   v1494928657/cat_16_fqt4dz.jpg v1494928656/cat_17_lkvjpi.jpg v1494928664/cat_18_b6ch5t.jpg
                   v1494928656/cat_19_uku9xz.jpg v1494928665/cat_20_kc5s6i.jpg v1494928660/cat_21_dvldto.jpg
                   v1494928664/cat_22_jjtqbz.jpg v1494928662/cat_23_d6jdho.jpg v1494928667/cat_24_kf3vpt.jpg
                   v1494928665/cat_25_uqpaan.jpg v1494928669/cat_26_ktu470.jpg v1494928668/cat_27_gph48d.jpg
                   v1494928678/cat_28_fhveis.jpg v1494928671/cat_29_jd9dod.jpg v1494928678/cat_30_izoyux.jpg
                   v1494928676/cat_31_ph9grt.jpg v1494928679/cat_32_u33riz.jpg v1494928675/cat_33_ggs8u2.jpg
                   v1494928675/cat_34_slkjfa.jpg v1494928684/cat_35_dbesbg.jpg v1494928678/cat_36_dmqmml.jpg
                   v1494928680/cat_37_tbr534.jpg v1494928683/cat_38_t6hpcu.jpg v1494928684/cat_39_hw2wlx.jpg
                   v1494928687/cat_40_waqeux.jpg
                  )

print "About to add cats..."

CATS_PICTURES_URLS.each do |cat_picture_url|
  cat = Cat.new(
    name: Faker::Cat.name,
    description: Faker::Cat.breed,
    address: "#{Faker::Address.street_address}, #{CITIES.sample}",
    price: rand(10..20)
  )
  cat.save
  url = "http://res.cloudinary.com/zank94/image/upload/#{cat_picture_url}"
  cat.photo_url = url
  print "#{cat.name} added to the database..."
end

print "About to add users..."

10.times do
  user = User.new(
    username: Faker::LordOfTheRings.character,
    email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com",
    password: Faker::StarWars.specie
  )
  user.save
  print "#{user.username} added to the database..."
  1.upto(3) do
    booking = Booking.new(
      book_date: Date.today - rand(1..500)
    )
    booking.cat = Cat.all.order("RANDOM()").first
    booking.user = user
    booking.save
    print "Booking added between #{booking.user.username} and #{booking.cat.name}"
  end
end
