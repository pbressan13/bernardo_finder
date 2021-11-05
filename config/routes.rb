Rails.application.routes.draw do
  resources :services do
    resources :bookings
  end
  post 'bookings/:id/rating', to: 'bookings#create_rating'
  get 'users/:user_id/bookings', to: 'bookings#index', as: :my_bookings
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
