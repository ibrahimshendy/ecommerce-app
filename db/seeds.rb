# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

predefined_categories = [
  {
    name: 'Clothes',
    slug: 'clothes',
    products: [
      {name: 'T-shirt', price: 100, quantity: 10, description: "Is a beautiful T-shirt.", sort: 1},
      {name: 'Pants', price: 150, quantity: 8, description: "Is a beautiful Pants.", sort: 2},
      {name: 'Hat', price: 100, quantity: 15, description: "Is a beautiful Hat.", sort: 3},
    ]
  },
  {
    name: 'Mobiles',
    slug: 'mobiles',
    products: [
      {name: 'Iphone 14', price: 15999, quantity: 45, description: "Is a beautiful mobile.", sort: 1},
      {name: 'Samsung A52', price: 12500, quantity: 50, description: "Is a beautiful mobile Samsung A52.", sort: 2},
      {name: 'Sony 23', price: 13000, quantity: 25, description: "Is a beautiful mobile sony.", sort: 3},
    ]
  },
  {
    name: 'Laptop',
    slug: 'laptop',
    products: [
      {name: 'HP Z book', price: 25990, quantity: 20, description: "Is a beautiful LabTop.", sort: 1},
      {name: 'Dell', price: 22500, quantity: 14, description: "Is a beautiful LabTop.", sort: 2},
      {name: 'Lenovo', price: 23000, quantity: 13, description: "Is a beautiful mobile sony.", sort: 3},
    ]
  },
  {
    name: 'Electronics',
    slug: 'electronics',
    products: [
      {name: 'Fan', price: 5990, quantity: 12, description: "Is a beautiful fan.", sort: 1},
      {name: 'Fridge', price: 32500, quantity: 5, description: "Is a beautiful Fridge.", sort: 2},
    ]
  },
]

predefined_categories.each do  |category|
  @category_model = Category.find_or_create_by({ name: category[:name], slug: category[:slug], status: 'active'})

  category[:products].each do |product|
    @category_model.products.find_or_create_by(
      {
        name: product[:name],
        price: product[:price],
        quantity: product[:quantity],
        description: product[:description],
        sort: product[:sort],
      }
    )
  end
end

puts "Categories and Products seeded successfully";