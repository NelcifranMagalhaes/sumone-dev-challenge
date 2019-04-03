class DrinksController < ApplicationController
  def index
    @q = Drink.order(name: :asc).ransack(params[:q])
    @drinks = @q.result.page(params[:page]).per(10)
  end

  def advanced_search
     redirect_to root_path, notice: 'entrou em advanced serach action.'
  	
  end

end
