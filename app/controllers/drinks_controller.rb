class DrinksController < ApplicationController

  def index
  	@drinks = Drink.all.page(params[:page]).per(10)
  end

end
