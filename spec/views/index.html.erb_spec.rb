require 'rails_helper'
require 'capybara/rspec'


RSpec.describe "search index", type: :feature do
	before :each do
	  FactoryBot.create(:drink)
	end
	#Esses testes verificam quando o usuário pesquisa um texto,caso ele seja verdadeiro traga um drink dentro de uma classe card 
	it "using simple search" do
	  visit '/drinks'
	  fill_in 'name', with: 'Drink'
	  click_button 'Simple Search'
	  expect(page).to have_css '.card'
	end

	it "using advanced search" do
	  visit '/drinks'
	  select('hot', from: 'temperature')
	  click_button 'Advanced Search'
	  expect(page).to have_css '.card'
	end

end