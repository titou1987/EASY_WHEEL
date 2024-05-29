Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes do
    resources :rentals, only: %i[create]
  end

  get 'owner_dashboard', to: "pages#owner_dashboard"
  get 'renter_dashboard', to: "rentals#renter_dashboard"
  resources :rentals, only: %i[update]
  # get 'rentals/:id/accept', to: "rentals#accepted"
  # get 'rentals/:id/decline', to: "rentals#declined"
end
