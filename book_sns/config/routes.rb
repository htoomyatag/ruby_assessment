Rails.application.routes.draw do
  devise_for :users
  resources :generes
  resources :authors
  resources :users
  resources :books
  resources :publishers
  resources :reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get 'search_review' => "reviews#search_review", as: "search_review"
      post 'login' => "authentications#login", as: "login"  
    end
  end
end
