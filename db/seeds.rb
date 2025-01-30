# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Iniciando semillas..."

user_juan = User.create(
  name: "Juan", 
  email: "juan@ejemplo.cl", 
  password: "password", 
  password_confirmation: "password", 
  address: "Calle 123", 
  phone: "+56930346788"
)

user_pedro = User.create(
  name: "Pedro", 
  email: "pedro@ejemplo.cl", 
  password: "password", 
  password_confirmation: "password", 
  address: "Calle 321", 
  phone: "+56920346728"
)

Exchange.create(
  amount: 1000, 
  exchange_type: :virtual_to_cash, 
  status: :available, 
  address: "Calle 123", 
  user: user_juan
)

Exchange.create(
  amount: 2000, 
  exchange_type: :cash_to_virtual, 
  status: :available, 
  address: "Calle 321", 
  user: user_pedro
)
