Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :listings
      resources :auctions
      resources :bids
      resources :comments
      resources :images, only: [:index, :show, :update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
