Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :tasks
  end

  resources :users do
    resources :tasks
  end

  # get '/categories/:id' => 'categories#show', as: 'show_category'
end
