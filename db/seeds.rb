# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Add Distributors
# Distributor.create(name: 'Holt')
# Distributor.create(name: 'Jetro')
# Distributor.create(name: 'US Foods')
# Distributor.create(name: 'Gordon')

# Add Count By
# CountBy.create(name: '%')
# CountBy.create(name: 'EA')
# CountBy.create(name: 'BIN')
# CountBy.create(name: 'SLEEVE')

# Add Category
# Category.create(name: 'Dry')
# Category.create(name: 'Frozen')
# Category.create(name: 'Refrigerated')

# Add Products
# 20.times do 
#   Product.create(
#     name:Faker::Food.dish, 
#     distributor_id: Distributor.all.ids.sample,
#     count_by_id: CountBy.all.ids.sample, 
#     category_id: Category.all.ids.sample, 
#     case_quantity: rand(0..20),
#     price: rand(0.1...100.0).round(2), 
#     mark_up: rand(1..15),
#     prepped: false
#   )
# end

# StoreType.create(name: 'Restaurant')
# StoreType.create(name: 'Prepcenter')

# Add locations
10.times do 
  Location.create(
    name: Faker::House.room,
    store_id: [1,2].sample
  )
end

