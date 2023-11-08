# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Product.destroy_all

puts "Creating products..."

products = [
  {
    name: "Mongoose bmx",
    description: "A high-quality mountain bike for your outdoor adventures.",
    price: 50.00
  },

  {
    name: "Nikon D6 DSLR",
    description: "A professional DSLR camera for capturing stunning photos and videos.",
    price: 300.00
  },

  {
    name: "Yamaha C40M Acoustic Guitar",
    description: "A classic acoustic guitar for music enthusiasts.",
    price: 150.00
  },

  {
    name: "Microsoft Surface Pro 9",
    description: "A high-performance laptop for all your computing needs.",
    price: 600.00
  },

  {
    name: "Bluefin Tandem 2-Person Kayak",
    description: "A tandem kayak for enjoying water sports with a friend.",
    price: 70.00
  },

  {
    name: "Hochwertiges 4-Personen-Zelt",
    description: "A spacious tent for your camping adventures in the great outdoors.",
    price: 40.00
  },

  {
    name: "iPhone 15 Pro",
    description: "The latest smartphone with a high-resolution display and a powerful camera.",
    price: 350.00
  },

  {
    name: "Boondocker Recycled 26L Hiking Backpack",
    description: "A comfortable and durable hiking backpack for your treks and hikes.",
    price: 30.00
  },

  {
    name: "KitchenAid Artisan Stand Mixer",
    description: "A versatile kitchen mixer for baking and cooking enthusiasts.",
    price: 60.00
  },

  {
    name: "Playstation 5 console",
    description: "A gaming console for endless gaming fun and entertainment.",
    price: 250.00
  }
]


User.all.each do |user|
  products.each do |attributes|
    user.products.create!(attributes)
    puts "Created #{attributes[:name]} for #{user.first_name}"
  end
end

puts "Product Creation complete. Congratulations!"

puts "Congratulations! Mr. Nhye your database has been seeded with products from the depths of your imagination."
