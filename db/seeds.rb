require "faker"

puts "Destroying current cats database..."

Cat.destroy_all

CITIES = %w(Bordeaux Lyon Paris Marseille)
CATS_PICTURES = %w(cat_1_lcdl8w cat_2_euuf34 cat_3_yeioxl cat_4_nfxdhe cat_5_ezdqoz
                   cat_6_o1xlfc cat_7_zshq0o cat_8_onzosc cat_9_k8og65 cat_10_ljbynk
                   cat_11_ilg3st cat_12_zgqqcb cat_13_e7v74k cat_14_vg7hzy cat_15_eofzph
                   cat_16_fqt4dz cat_17_lkvjpi cat_18_b6ch5t cat_19_uku9xz cat_20_kc5s6i
                   cat_21_dvldto cat_22_jjtqbz cat_23_d6jdho cat_24_kf3vpt cat_25_uqpaan
                   cat_26_ktu470 cat_27_gph48d cat_28_fhveis cat_29_jd9dod cat_30_izoyux
                   cat_31_ph9grt cat_32_u33riz cat_33_ggs8u2 cat_34_slkjfa cat_35_dbesbg
                   cat_36_dmqmml cat_37_tbr534 cat_38_t6hpcu cat_39_hw2wlx cat_40_waqeux
                  )

CATS_PICTURES.each do |cat_picture|
  cat = Cat.new(
    name: Faker::Cat.name,
    description: Faker::Cat.breed,
    address: "#{Faker::Address.street_address}, #{CITIES.sample}",
    price: rand(10..20)
  )
  cat.save
  cat.photo = cat_picture
  print "#{cat.name} added to the database..."
end
