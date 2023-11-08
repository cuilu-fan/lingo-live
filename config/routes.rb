Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :user_flashcards, only: [:new, :create, :update, :destroy]
  post 'user_flashcards/translate', to: 'user_flashcards#translate', as: :translate
  resources :categories, except: [:destroy]
  resources :calls, only: [ :index, :create, :destroy ] do
    collection do
      get :random
    end
    member do
      patch :next
    end
  end

  resources :friends, only: [:index, :new, :create] do
    resources :chatrooms, only: :create
    member do
      patch :accept
    end
    collection do
      post :create_from_call
    end
  end
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
  get "friends/friend_request", to: "friends#friend_request", as: "friend_request"
end
