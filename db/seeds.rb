# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

descricoes = [
    "Sou muito bom no que faço",
    "Tenho 10 anos de experiencia com churrasco",
    "Não queimo a carne",
    "Só carnes de elite",
    "Rodrigo Hilbert dos churrascos"
            ]

puts 'Creating 100 fake posts...'
100.times do
  user = User.new(
    email: Faker::Internet.email,
    encrypted_password: "123456",
    name: Faker::Name.name,
    barbecue_flag: true,
    address: Faker::Address.full_address,
    description: descricoes.sample,
    distance_radius: 15,
    avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
  )
  user.save!

  service = Service.new(
    user: user,
    available: true,
    price_hour: (10..120).to_a.sample,
    address: Faker::Address.full_address,
    description: descricoes.sample,
    title: "Churrasco",

  )

  service.save!
end
puts 'Finished!'
