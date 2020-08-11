Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :create]
  resources :users, only: [:create]
  resources :tasks, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :create]
  resources :comments, only: [:index, :create, :destroy]
  resources :user_boards, only: [:index, :create]

  post '/login', to: 'users#login'
  get '/autologin', to: 'users#autologin'

  get '/logout', to: 'users#logout'

end
