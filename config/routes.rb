Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :bookings, only: [:new, :create]
  end

  resources :favorites, only: [:create, :destroy]

  resources :bookings do
    member do
      post :approve
      get :approve
      post :deny
      get :deny
    end
  end
end
