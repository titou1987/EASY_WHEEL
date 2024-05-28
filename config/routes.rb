Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bikes do
    resources :rentals, only: %i[update create]
  end

  get 'dashboards', to: "pages#dashboard"
end
