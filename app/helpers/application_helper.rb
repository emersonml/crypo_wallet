module ApplicationHelper
    def nome_application
        "CRYPO WALLET"
    end
    def data_br(e_data_us)
        e_data_us.strftime("%d/%m/%Y")
    end
    def environments()
        if Rails.env.development?
            "DESENVOLVIMENTO"
        elsif Rails.env.production?
            "PRODUÇÃO"
        else
            "TESTE"
        end
    end
end

