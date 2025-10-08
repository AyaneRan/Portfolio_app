Rails.application.routes.draw do
  get "static_pages/home"
  root "static_pages#home"
  get "users/new"
  get "users/show"
  get "signup", to: "users#new"
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  resources :users
  resources :password_resets, only: %i[new create edit update]
end
