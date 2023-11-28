Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  namespace :hello do
    root "top#index"
  end


  resources :questions
  root 'questions#index'
  
  
end
