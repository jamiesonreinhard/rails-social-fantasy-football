Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/teams/:id/settings', to: 'teams#settings', as: 'team_settings'
  get '/leagues/:id/settings', to: 'leagues#settings', as: 'league_settings'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :leagues do
    resources :posts
  end
  resources :posts do
    resources :comments
  end
end
