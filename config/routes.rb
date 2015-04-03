Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :friendships

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
