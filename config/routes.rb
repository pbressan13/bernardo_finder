Rails.application.routes.draw do

  resources :bookings
  resources :services
  post 'bookings/:id/rating', to: 'bookings#create_rating'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
