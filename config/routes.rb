Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :user_flashcards, only: [:new, :create, :update, :destroy]
  post 'user_flashcards/translate', to: 'user_flashcards#translate', as: :translate
  resources :categories, except: [:destroy]
  resources :calls, only: [ :index, :show ]
  resources :friends, only: [:index, :show, :new, :create, :search] do
    resources :chatrooms, only: :create
  end
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
end
