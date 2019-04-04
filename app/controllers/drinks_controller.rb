class DrinksController < ApplicationController
  def index
    @q = Drink.order(name: :asc).ransack(params[:q])
    @drinks = @q.result.page(params[:page]).per(10)
  end

  def advanced_search
  	drink_type = params['drink_type']
  	age = params['age']
  	country = params['country']
  	drunked = params['drunked']
  	sugar = params['sugar']
  	array_search = Array.new()
  	if drink_type.present? && age.present? && country.present? && drunked.present? && sugar.present?

		redirect_to root_path, notice: 'Your recomendations is here.'

  	else

		redirect_to root_path, notice: 'Fill all fields for you recomendation.'
  		
  	end

  	
  end

end
