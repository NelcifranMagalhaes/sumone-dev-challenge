class DrinksController < ApplicationController

  def index
  	@drinks = Drink.page(params[:page]).per(10)
  	name = params['name']
  	temperature = params['temperature']
  	alcohol_level = params['alcohol_level']
  	sugar = params['sugar']
  	search = params['search']

  	if search == 'simple'
	  	if name.present?
			@drinks = Drink.where("name like '%#{name}%'").page(params[:page]).per(10)
	  	end

	 elsif search == 'advanced'
	 	if temperature.present? || alcohol_level.present? || sugar.present?
	 		@drinks = @drinks.where("temperature = #{temperature}") unless temperature.blank?
	 		# @drinks = @drinks.where("alcohol_level ")
	 		@drinks.page(params[:page]).per(10)
	 	end

  	end
  end

end
