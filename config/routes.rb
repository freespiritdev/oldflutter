Rails.application.routes.draw do

  resources :users
  resources :friendships

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
