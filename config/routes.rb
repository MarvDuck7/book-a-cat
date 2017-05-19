Rails.application.routes.draw do
  resources :cats, only: %i(index show new create destroy), shallow: true do
    resources :bookings, only: %i(create show update) do
      patch 'updatestatus', to: 'bookings#updatestatus'
      collection do
        get 'mycatbookings', to: 'bookings#mycatbookings'
      end
    end
    collection do
      get 'mycats', to: 'cats#mycats'
    end
  end
  resources :bookings, only: %i(index show)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'pages#home'
  mount Attachinary::Engine => '/attachinary'
end
