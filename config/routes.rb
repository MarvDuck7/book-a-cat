Rails.application.routes.draw do
  resources :cats, only: %i(index show), shallow: true do
    resources :bookings, only: %i(create)
  end
  resources :users, shallow: true do
    resources :bookings, only: %i(index show)
  end
  devise_for :users
  root to: 'pages#home'
  mount Attachinary::Engine => '/attachinary'
end
