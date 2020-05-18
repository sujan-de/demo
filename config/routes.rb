Rails.application.routes.draw do
  # get 'users/show'
  # get 'events/index'
  # get 'events/show'
  root 'pages#index'
  devise_for :users
  resources :users, only: [:show] do
    member do
      get 'events_preview'
    end
  end
  resources :events, only: [:index, :show, :create]
  resources :comments, only: [:create]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
