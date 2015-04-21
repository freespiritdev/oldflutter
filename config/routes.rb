Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :friendships
  resources :main
  resources :flits
  resources :sessions

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
