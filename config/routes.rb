Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get 'signup' => 'users#new'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end