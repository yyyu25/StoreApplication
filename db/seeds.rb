# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

products = [
  {
    name: "Apple MacBook Air M3",
    description: "Lightweight laptop with Apple M3 chip, 13-inch Retina display.",
    image: "macbook_air_m3.jpg",
    price: 1199.99
  },
  {
    name: "Sony WH-1000XM5 Headphones",
    description: "Noise-cancelling wireless headphones with 30-hour battery life.",
    image: "sony_wh1000xm5.jpg",
    price: 399.99
  },
  {
    name: "Nintendo Switch OLED",
    description: "Hybrid console with 7-inch OLED screen and improved audio.",
    image: "switch_oled.jpg",
    price: 349.99
  },
  {
    name: "iPhone 15 Pro",
    description: "Latest iPhone model with A17 chip and titanium frame.",
    image: "iphone15pro.jpg",
    price: 999.00
  },
  {
    name: "Samsung 4K Smart TV 55\"",
    description: "Ultra HD LED smart TV with HDR and voice assistant support.",
    image: "samsung_4k_tv.jpg",
    price: 649.50
  },
  {
    name: "Dyson V12 Detect Slim",
    description: "Powerful cordless vacuum cleaner with laser dust detection.",
    image: "dyson_v12.jpg",
    price: 749.00
  },
  {
    name: "Apple Watch Series 9",
    description: "Smartwatch with health tracking and double-tap gesture.",
    image: "apple_watch_9.jpg",
    price: 429.00
  },
  {
    name: "GoPro HERO12 Black",
    description: "Action camera with 5.3K video and improved stabilization.",
    image: "gopro_hero12.jpg",
    price: 449.99
  },
  {
    name: "Kindle Paperwhite",
    description: "Waterproof e-reader with adjustable warm light.",
    image: "kindle_paperwhite.jpg",
    price: 159.99
  },
  {
    name: "Logitech MX Master 3S",
    description: "Ergonomic wireless mouse with MagSpeed scroll wheel.",
    image: "logitech_mx3s.jpg",
    price: 99.99
  }
]

Product.create!(products)