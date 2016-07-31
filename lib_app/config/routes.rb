Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  resources :users, only: [:index, :new, :show, :create]

  get '/sign_in' => 'sessions#new'
  post 'sessions' => 'sessions#create'

  get '/libraries' => to: 'libraries#index'
  get '/libraries/new' => 'libraries#new', :as => 'new_library'
  post '/libraries' => 'libraries#create'

end
