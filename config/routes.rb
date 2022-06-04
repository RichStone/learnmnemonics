Rails.application.routes.draw do
  resources :major_system_pegs
  root "major_system_pegs#index"
end
