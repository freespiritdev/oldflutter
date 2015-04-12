Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :friendships
  resources :main
  resources :flits

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
