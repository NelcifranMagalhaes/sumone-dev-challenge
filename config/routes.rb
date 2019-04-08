Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'
  post '/drinks' , to: 'drinks#index'
  get '/drinks' , to: 'drinks#index'
  resources :home, only: %i[index]
end
