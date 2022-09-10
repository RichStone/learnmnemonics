Rails.application.routes.draw do
  resources :major_systems
  resources :pegs

  get "/public/major_systems", to: "public_pages#major_systems"

  root "public_pages#major_systems"
end
