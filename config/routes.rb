Rails.application.routes.draw do
  resources :players
  resources :games

  root "dashboard#index"
end
