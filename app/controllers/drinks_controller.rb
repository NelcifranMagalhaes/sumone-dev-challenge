class DrinksController < ApplicationController

  def index
  	@drinks = Drink.order(name: :asc).page(params[:page]).per(10)
  	name = params['name']
  	temperature = params['temperature']
  	alcohol_level = params['alcohol_level']
  	sugar = params['sugar']
  	sophisticated = params['sophisticated']
  	search = params['search']

  	if search == 'simple'
	  	if name.present?
			@drinks = Drink.where("name like '%#{name}%'").order(name: :asc).page(params[:page]).per(10)
	  	end

	 elsif search == 'advanced'
	 	if temperature.present? || alcohol_level.present? || sugar.present? || sophisticated.present?
	 		@drinks = @drinks.where("temperature = #{temperature}") unless temperature.blank?
	 		@drinks = alcohol_level == 'Yes' ? @drinks.where("alcohol_level >= 30") : @drinks.where("alcohol_level < 30") unless alcohol_level.blank?
	 		@drinks = sugar == 'Yes' ? @drinks.where("ibu < 5") : @drinks.where("ibu >= 5") unless sugar.blank?
	 		@drinks = sophisticated == 'Yes' ? @drinks.where("rating_avg >= 4.43") : @drinks.where("rating_avg < 4.43") unless sophisticated.blank?
	 		@drinks.order(name: :asc).page(params[:page]).per(10)
	 	end

  	end
  end

end
