Rails.application.routes.draw do

  get "static_pages/home"
  root "static_pages#home"

  
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "signup", to: "users#new"


  resources :microposts, only: %i[index create destroy]

  
  resources :users, only: %i[new create show edit update], path: "/users"

  
  resources :password_resets, only: %i[new create edit update]


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
