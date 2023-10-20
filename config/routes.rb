Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :user_flashcards, only: [:new, :create, :destroy]
  resources :categories, only: %i[index new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
