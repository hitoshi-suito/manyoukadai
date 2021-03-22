Rails.application.routes.draw do
  resources :tasks do
    collection do
      get :search
    end
  end
  root :to => 'tasks#index'

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

end
