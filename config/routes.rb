Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes
  resources :rentals, only: %i[update create]
  get 'dashboards', to: "pages#show"
end
