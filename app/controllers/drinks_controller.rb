class DrinksController < ApplicationController

  def index
  	@drinks = Drink.order(name: :asc).page(params[:page]).per(10)
  	name = params['name']
  	temperature = params['temperature']
  	alcohol_level = params['alcohol_level']
  	sugar = params['sugar']
  	sophisticated = params['sophisticated']
  	search = params['search']
  	# o algoritmo é simples, fiz uma busca aninhada, verifico se ele preencheu os campos , se o campo foi preenchido corretamente
  	#faço uma busca usando aquele campo, vou para o proximo campo usando a busca já do campo anterior caso ele tenha preenchido,
  	#fiz a média para campos como alchool_level ,sugar and sophisticated e dividi metade para baixo e outra metade para cima ,para dividir
  	#as perguntas entre sim(metade abaixo de x) e não(metade acima de x).
  	if search == 'simple'
	  	if name.present?
			 @drinks = Drink.where("name like '%#{name}%'").order(name: :asc).page(params[:page]).per(10)

       if @drinks.size == 0
         respond_to do |format|
           format.html { redirect_to root_path,notice: 'We dont have this drink, try again :('}
           format.json { head :no_content }
         end
       end
	  	end

	 elsif search == 'advanced'
	 	if temperature.present? || alcohol_level.present? || sugar.present? || sophisticated.present?
	 		@drinks = @drinks.where("temperature = #{temperature}") unless temperature.blank?
	 		@drinks = alcohol_level == 'Yes' ? @drinks.where("alcohol_level >= 30") : @drinks.where("alcohol_level < 30") unless alcohol_level.blank?
	 		@drinks = sugar == 'Yes' ? @drinks.where("ibu < 5") : @drinks.where("ibu >= 5") unless sugar.blank?
	 		@drinks = sophisticated == 'Yes' ? @drinks.where("rating_avg >= 4.43") : @drinks.where("rating_avg < 4.43") unless sophisticated.blank?
	 		@drinks.order(name: :asc).page(params[:page]).per(10)

      if @drinks.size == 0
        respond_to do |format|
          format.html { redirect_to root_path,notice: 'We dont have any recomendation for you now, try again :('}
          format.json { head :no_content }
        end
      end    
	 	end
  	end

  end

end
