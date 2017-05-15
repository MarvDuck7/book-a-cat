require "faker"

puts "Destroying current cats database..."

Cat.destroy_all

CITIES = %w(Bordeaux Lyon Paris Marseille)

40.times do
  cat = Cat.new(
    name: Faker::Cat.name,
    description: Faker::Cat.breed,
    address: "#{Faker::Address.street_address}, #{CITIES.sample}",
    price: rand(10..20)
  )
  cat.save
  print "#{cat.name} added to the database..."
end
