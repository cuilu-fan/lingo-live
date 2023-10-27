Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :user_flashcards, only: [:new, :create, :update, :destroy]
  post 'user_flashcards/translate', to: 'user_flashcards#translate', as: :translate
  resources :categories, except: [:destroy]
  resources :calls, only: [ :index, :show ]
  resources :friends, only: [:index, :show] do
    resources :messages, only: [:create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
