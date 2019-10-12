Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'users/:id/edit_profile', to: 'edit_profile#edit',  as: :edit_profile
  patch 'users/:id/edit_profile', to: 'edit_profile#update',  as: :update_profile

  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :plans, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
end