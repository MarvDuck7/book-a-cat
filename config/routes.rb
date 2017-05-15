Rails.application.routes.draw do
  resources :cats, only: %i(index show), shallow: true do
    resources :bookings, only: %i(index show create) do
      resources :reviews, only: %i(create)
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
