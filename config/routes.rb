Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :friendships
  resources :main

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
