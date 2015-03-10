Rails.application.routes.draw do

  resources :users

  get 'welcome/about'

  root to: 'welcome#index'

end
