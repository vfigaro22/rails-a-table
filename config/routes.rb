Rails.application.routes.draw do
  devise_for :users
  # default route / home page
  root to: 'pages#home'

  # user routes
  # get 'signin', to: 'pages#signin', as: :signin
  # get 'signup', to: 'pages#signup', as: :signup
  # post 'signup', to: 'users#create'
  # get 'profile', to: 'pages#profile'

  # Product routes

  # Product_reviews routes
  # get 'products/:id/reviews', to: 'reviews#index', as: :product_reviews
  # get 'products/:id/reviews/new', to: 'reviews#new', as: :new_product_review
  # post 'products/:id/reviews/new', to: 'reviews#create'
  # get 'products/:id/reviews/:id', to: 'reviews#show', as: :product_review

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :products, only: %i[index show]
  # resources :users, only: %i[show create new] do
  #  resources :products, only: %i[index create new show edit update]
  #   member do
  #     resources :bookings, only: %i[index show create new]
  #     resources :reviews, only: %i[show create new]
  # end
  resources :products do
    collection do
      get :sets
      get :plates
      get :cutleries
      get :glasses
    end
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
end
