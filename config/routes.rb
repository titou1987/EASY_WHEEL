Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes
  resources :rentals, only: %i[update]
  get 'dashboards', to: "pages#show"
end
