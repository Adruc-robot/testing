Rails.application.routes.draw do
  resources :list_entries
  root "home#index"
  get 'home/index'
  get 'home/about'
  #resources :lists
  resources :lists do
    resources :list_entries
    #psuedo table
    collection do
      get :listEntries
    end
  end
  resources :receipts
  resources :businesses
  resources :accounts
  #devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
