namespace :dev do

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...dev.rake"){%x(rails db:drop)}
      show_spinner("Criando BD...dev.rake"){%x(rails db:create)}
      show_spinner("Migrando BD...dev.rake"){%x(rails db:migrate)}
      #show_spinner("Populando BD...dev.rake"){%x(rails db:seed)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "V_ocê não está em ambiente de desenvolvimento"
    end

  end
  desc "Cadastro de Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas") do
      coins = [
          {description: "Bitcoin", acronym: "BTC", url_image: "https://img2.gratispng.com/20181128/ule/kisspng-bitcointalk-cryptocurrency-initial-coin-offering-e-blockkedjor-arkiv-sida-3-av-3-it-ord-5bfee5ac53c1f9.4827801715434315963431.jpg"},
          {description: "Ethereum", acronym: "ETH", url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/1200px-Ethereum-icon-purple.svg.png"},
          {description: "Dash", acronym: "DASH", url_image: "https://i1.sndcdn.com/avatars-000502587411-ky4wcg-t500x500.jpg"},
          {description: "Iota", acronym: "IOT", url_image: "https://www.comocomprarcriptomoedas.com/wp-content/uploads/2018/04/logotipo-IOTA-4.png"},
          {description: "ZCash", acronym: "ZEC", url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"}
      ]
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end


  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído com dev.rake")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end


end


