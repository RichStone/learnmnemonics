Rails.application.routes.draw do
  devise_for :brains
  resources :major_systems
  resources :pegs

  namespace :public do
    resources :major_systems, only: [:index, :show]
    resource :homepage, only: :show
  end

  root "public/major_systems#index"
end
