Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'register', to: 'sessions#register'
  
  get 'reset', to: 'password_resets#reset'
  
  get 'users/:id/edit_profile', to: 'users#edit_profile',  as: :edit_profile
  patch 'users/:id/edit_profile', to: 'users#update_profile'

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
  
  get  'contact' =>'contacts#index'
  post 'contact/confirm' => 'contacts#confirm'
  post 'contact/done' => 'contacts#done'
  
  get 'tos', to: 'toppages#tos', as: :tos
  get 'privacy', to: 'toppages#privacy', as: :privacy
  get 'company', to: 'toppages#company', as: :company
  get 'faq', to: 'toppages#faq', as: :faq
  
  get  'quit' =>'quits#new'
  post  'quit' =>'quits#create'
  get  'quits' =>'quits#index'
  
  get 'users/popular', to: 'users#popular', as: :popular_users
  
  get 'model_wanted', to: 'plans#model_wanted', as: :model_wanted
  

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
      get 'confirm'
    end
  end
  
  resources :schedules, only: [:create]
  resources :favorites, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :information, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :prefectures, only: [] do
    resources :cities, only: :index do
      resources :spots, only: :index
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  
end