Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes do
    resources :rentals, only: %i[update create]
  end

  get 'owner_dashboard', to: "pages#owner_dashboard"
  get 'renter_dashboard', to: "rentals#renter_dashboard"
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes do
    resources :rentals, only: %i[update create]
  end

  get 'owner_dashboard', to: "pages#owner_dashboard"
  get 'renter_dashboard', to: "rentals#renter_dashboard"
end
