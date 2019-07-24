# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = %w(chinese italian japanese french belgian)
# "chinese", "italian", "japanese", "french", "belgian"

Restaurant.delete_all if Rails.env.development?

10.times do
  Restaurant.create!(name: Faker::Company.name,
                    address: Faker::Address.city,
                    category: category.sample,
                    phone_number: Faker::PhoneNumber.phone_number,
                    )
end

puts "Created #{Restaurant.count} Restaurants"
