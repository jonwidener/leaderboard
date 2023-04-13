Rails.application.routes.draw do
  resources :matches
  get 'leaderboard/index'
  post 'leaderboard/add_win_to_player/:id' => 'leaderboard#add_win_to_player'
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "leaderboard#index"
end
