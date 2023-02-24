Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[new create show index] do
      resources :bookmarks, only: [:new, :create]
    end
  resources :bookmarks, only: [:destroy]
  end

  # Defines the root path route ("/")
  # root "articles#index"
