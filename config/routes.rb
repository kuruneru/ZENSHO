Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"


  resources :questions
  root 'questions#index'
  
  get '/new_questions', to: 'questions#index', as: 'new_questions_path'
  
end
