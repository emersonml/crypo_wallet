namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando o BD")
      spinner.auto_spin
        %x(rails db:drop)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Criando BD")
      spinner.auto_spin
        %x(rails db:create)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Migrando  BD")
      spinner.auto_spin
        %x(rails db:migrate)
      spinner.success('(successful)')

      spinner = TTY::Spinner.new("[:spinner] Populando BD")
      spinner.auto_spin
       puts %x(rails db:seed)
      spinner.success('(successful)')
    else
      puts "V_ocê não está em ambiente de desenvolvimento"
    end

  end

end
