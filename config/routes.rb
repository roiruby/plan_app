Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'users/:id/edit_profile', to: 'edit_profile#edit',  as: :edit_profile
  patch 'users/:id/edit_profile', to: 'edit_profile#update',  as: :update_profile

  get 'signup', to: 'users#new'
  
  get 'plans/new_arrival', to: 'plans#new_arrival',  as: :new_arrival
  get 'plans/popular', to: 'plans#popular',  as: :popular
  get 'plans/recommend', to: 'plans#recommend',  as: :recommend
  
  get '/keywords/autocomplete.json', to: 'plans#keywordAutocomplete'
  
  get 'search', to: 'plans#search', as: :search
  get 'select_search', to: 'plans#select_search', as: :select_search
  
  get 'mypage', to: 'mypage#index', as: :mypage
  
  get 'categories/:id', to: 'categories#show', as: :category
  
  get 'prefectures/:id', to: 'prefectures#show', as: :prefecture
  get 'cities/:id', to: 'cities#show', as: :city
  get 'spots/:id', to: 'spots#show', as: :spot
  
  get 'keywords', to: 'keywords#index', as: :keyword

  

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :plans, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    
    collection do
      get '/:id/city' => 'plans#city', as: "city"
    end
  end
  
  resources :schedules, only: [:create]
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :information, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :prefectures, only: [] do
    resources :cities, only: :index do
      resources :spots, only: :index
    end
  end
  
  
end