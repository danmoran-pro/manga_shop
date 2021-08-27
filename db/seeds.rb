# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Merchant Seeds

animaniacs = Merchant.create(name: 'Animaniacs', address: '123 Leaf Rd.', city: 'Denver', state: 'CO', zip: '80204')
toyko_reads = Merchant.create(name: "Toyko Reads", address: '321 Sand Rd.', city: 'Denver', state: 'CO', zip: '80219')
jump_shop = Merchant.create(name: "Jump Shop", address: '456 Jump St.', city: 'Denver', state: 'CO', zip: '80220')
tokyo_station = Merchant.create(name: "Tokyo Station", address: '654 Tokyo St.', city: 'Denver', state: 'CO', zip: '80221')
akiba = Merchant.create(name: " Akiba Culture Zone", address: '789 Culture St.', city: 'Denver', state: 'CO', zip: '80222')