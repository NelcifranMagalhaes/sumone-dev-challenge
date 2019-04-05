Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'
  post '/advanced_search' , to: 'drinks#advanced_search'
  get '/advanced_search' , to: 'drinks#index'

  resources :home, only: %i[index]
end
