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
  {name: 'Clothes', slug: 'clothes'},
  {name: 'Mobiles', slug: 'mobiles'},
  {name: 'Laptop', slug: 'laptop'},
  {name: 'Electronics', slug: 'electronics'},
]

predefined_categories.each do  |category|
  Category.find_or_create_by({ name: category[:name], slug: category[:slug], status: 'active'})
end

puts "Categories seeded successfully";