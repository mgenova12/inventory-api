# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# Add Distributors
# Distributor.create(name: 'Holt')
# Distributor.create(name: 'Jetro')
# Distributor.create(name: 'US Foods')
# Distributor.create(name: 'Gordon')
# Distributor.create(name: 'Trappe')

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
Product.all.destroy_all
20.times do 
  price = rand(0.1...100.0).round(2)
  mark_up = rand(1..15)
  marked_up_price =  price + (price * (mark_up * 0.01))

  product = Product.new(
    name:Faker::Food.dish, 
    prepped: false,
    distributor_id: Distributor.all.ids.sample,
    category_id: Category.all.ids.sample, 
    case_quantity: rand(0..20),
    price: price, 
    mark_up: mark_up,
    barcode: rand(10 ** 9...10 ** 10),
    description: Faker::Food.description,
    distributor_number: rand(0..100),
    brand: Faker::Company.name,
    unit_size: Faker::Food.measurement,
    marked_up_price: marked_up_price.round(2)
  )
  prepped = [true, false].sample
  if prepped == true 
    portion_size = rand(0..20)
    prepped_mark_up = rand(0..40)
    prepped_marked_up_price = product.price + ((product.price / portion_size) * (prepped_mark_up * 0.01)) 
    p_product = Product.new(
      name: "Prepped #{Faker::Food.dish}",
      prepped: true,
      category_id: Category.all.ids.sample, 
      case_quantity: rand(0..20),
      portion_size: portion_size,
      mark_up: mark_up,
      marked_up_price: prepped_marked_up_price.round(2),
      barcode: rand(10 ** 9...10 ** 10),
      description: Faker::Food.description
    )
    p_product.save
    puts "Prepped Product created!"
  end
  product.save
  puts "Product created!"
end


StoreGood.all.destroy_all
40.times do 
  store_id = Store.all.ids.sample
  location_id = Store.find(store_id).locations.ids.sample
  store_good = StoreGood.new(
    store_id: store_id,
    product_id: Product.all.ids.sample,
    location_id: location_id,
    distributor_id: Distributor.all.ids.sample,
    max_amount: rand(0..100),
    count_by_id: CountBy.all.ids.sample,
    replenish_by_each: [true, false].sample,
    delivery_day: ["Tuesday","Friday","Both"].sample
  )
  store_good.save
  puts 'Store good created'
end












