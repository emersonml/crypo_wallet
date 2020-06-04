# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cadastrando moedas SEED"

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://img2.gratispng.com/20181128/ule/kisspng-bitcointalk-cryptocurrency-initial-coin-offering-e-blockkedjor-arkiv-sida-3-av-3-it-ord-5bfee5ac53c1f9.4827801715434315963431.jpg"
) 
Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/1200px-Ethereum-icon-purple.svg.png"
) 
Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://i1.sndcdn.com/avatars-000502587411-ky4wcg-t500x500.jpg"
) 

puts "Moedas cadastradas com SUCESSO"