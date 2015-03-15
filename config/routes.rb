Rails.application.routes.draw do

  resources :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
