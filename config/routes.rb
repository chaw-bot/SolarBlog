Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      post "new_comment", to: "comments#create", on: :member
      post "like_post", to: "likes#create", on: :member
    end
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index], defaults: {format: :json} do
        resources :comments, only: [:index, :create]
      end
    end
  end

  resources :comments, only: [:destroy]
end
