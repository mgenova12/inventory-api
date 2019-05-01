# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Add Distributors
Distributor.create(name: 'Holt')
Distributor.create(name: 'Jetro')
Distributor.create(name: 'US Foods')
Distributor.create(name: 'Gordon')

# Add Measurements
Measurement.create(name: '%')
Measurement.create(name: 'EA')
Measurement.create(name: 'BIN')
Measurement.create(name: 'SLEEVE')

# Add Product Types
ProductType.create(name: 'Dry')
ProductType.create(name: 'Frozen')
ProductType.create(name: 'Refrigerated')

# Add Products
20.times do 
  Product.create(
    name:Faker::Food.dish, 
    measurement_id: rand(1..4), 
    product_type_id: rand(1..3), 
    case_quantity: rand(0..20),
    price: rand(0.1...100.0).round(2), 
    distributor_id: rand(1..4)
  )
end

