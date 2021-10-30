Rails.application.routes.draw do

  resources :bookings
  resources :services
  post 'bookings/:id/rating', to: 'bookings#create_rating'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
