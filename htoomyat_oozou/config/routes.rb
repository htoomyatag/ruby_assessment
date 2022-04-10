Rails.application.routes.draw do
  resources :contents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contents#index"

  namespace :api do
    namespace :v1 do

        get 'published_contents' => "contents#index"
        post 'create_contents' => "contents#create"
    end
  end

end
