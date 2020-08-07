Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index]
  resources :users, only: [:create]
  resources :tasks, only: [:index, :create, :update, :destroy]
  resources :categories, only: [:index]
  resources :comments, only: [:index]
  resources :user_boards, only: [:index]

  post '/login', to: 'users#login'
  get '/autologin', to: 'users#autologin'

  get '/logout', to: 'users#logout'

  get '/userstats', to: 'games#userstats'

end
