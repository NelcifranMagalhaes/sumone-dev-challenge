require "rails_helper"

#Esses testes verificam quando o usuário envia o formulário, se ele é redirecionado para a pagina principal
RSpec.describe "Drink", :type => :request do

  it "Search drink with simple search" do

    post "/drinks", :params => { :search =>  "simple",:name =>  "Drink A"} 

    expect(response).to render_template(:index)

  end

  it "Search drink with advanced search" do

    post "/drinks", :params => { :search =>  "advanced",:temperature =>  "1"} 

    expect(response).to render_template(:index)

  end

end