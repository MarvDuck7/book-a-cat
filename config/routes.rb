Rails.application.routes.draw do
  resources :cats, only: %i(index show), shallow: true do
    resources :bookings, only: %i(create)
  end
  resources :bookings, only: %i(index show)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  mount Attachinary::Engine => '/attachinary'
end
