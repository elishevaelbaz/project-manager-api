Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index]
  resources :users, only: [:index]
  resources :tasks, only: [:index]
  resources :categories, only: [:index]
  resources :comments, only: [:index]
  resources :user_boards, only: [:index]

end
