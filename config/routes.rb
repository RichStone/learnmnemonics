Rails.application.routes.draw do
  resources :major_systems
  resources :pegs

  namespace :public do
    resources :major_systems, only: [:index, :show]
    resource :homepage, only: :show
  end

  get "/public/major_systems", to: "public_pages#major_systems"

  root "public_pages#major_systems"
end
