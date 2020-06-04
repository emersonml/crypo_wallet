class WelcomeController < ApplicationController
    #layout "adm"

    def index()
        @nome = params[:nome]
        @curso = "Rails"
    end
end
