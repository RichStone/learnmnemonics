Rails.application.routes.draw do
  resources :major_systems
  resources :pegs
  root "pegs#index"
end
