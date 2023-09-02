Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  namespace :admin do
    resources :restaurants do
      resources :tables
      resources :open_times, shallow: true, only: [:index, :create, :edit, :update, :destroy]
      resources :reservations, only: [:create, :edit, :update, :destroy] do
        collection do
          get 'search', to: 'reservations#search'
        end
      end
      resources :holidays, shallow: true, only: [:create, :destroy]
    end
  end

  resources :restaurants do
    member do
      post :filter_timelist
    end
    resources :build, only: [:show, :update]
  end

  resources :reservations, only: :destroy

  get '/success_page/:reservation_id', to: 'build#success_page', as: :success_page

  get "/sw.js", to: redirect('/404.html')
end
