require 'uuid'

uuid_generator = UUID.new

puts "Starting truckers"
10.times do
  Trucker.create!(
    email: Faker::Internet.unique.email
  )
end
puts "Create truckers success"


puts "Starting Shipments"

truckers = Trucker.all

puts truckers.count

10.times do
  shipment = Shipment.create!(
    status: Shipment.statuses.keys.sample,
    description: Faker::Lorem.sentence,
    delivery_date: Faker::Date.between(from: 1.week.ago, to: 2.weeks.from_now),
    lat: Faker::Address.latitude,
    long: Faker::Address.longitude,
    product: Faker::Commerce.product_name,
    trucker: truckers.sample
  )

  puts "Created shipment #{shipment.id}"
end
puts "Create shipments success"
