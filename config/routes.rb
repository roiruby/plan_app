Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'users/:id/edit_profile', to: 'edit_profile#edit',  as: :edit_profile
  patch 'users/:id/edit_profile', to: 'edit_profile#update',  as: :update_profile

  get 'signup', to: 'users#new'
  
  get 'plans/new_arrival', to: 'plans#new_arrival',  as: :new_arrival
  
  get '/keywords/autocomplete.json', to: 'plans#keywordAutocomplete'
  
  get 'search', to: 'plans#search', as: :search
  
  get 'mypage', to: 'mypage#index', as: :mypage
  
  # get "plans/image_count"
  

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :plans, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_area_children', defaults: { format: 'json' }
      get 'get_area_grandchildren', defaults: { format: 'json' }
      
      get '/:id/city' => 'plans#city', as: "city"
    end
  end
  
  resources :schedules, only: [:create]
  resources :favorites, only: [:create, :destroy]
  
  resources :prefectures, only: [] do
    resources :cities, only: :index do
      resources :spots, only: :index
    end
  end
  
  
end