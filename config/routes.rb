Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :create]
  resources :users, only: [:create]
  resources :tasks, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :create, :update]
  resources :comments, only: [:index, :create, :update, :destroy]
  resources :memberships, only: [:index, :create]
  resources :attachments, only: [:index, :create, :destroy]

  post '/login', to: 'users#login'
  get '/autologin', to: 'users#autologin'

  get '/logout', to: 'users#logout'

  patch '/tasks/:id/position', to: 'tasks#updatePosition', as: 'update_position'

end
