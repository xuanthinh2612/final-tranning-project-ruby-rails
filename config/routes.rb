Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
  resources :messages
  resources :sessions, as: :sets

  resources :pages do
    collection do
      get :about
    end
  end
  root 'pages#home'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'chatroom/index'
  mount ActionCable.server, at: '/cable'
end
