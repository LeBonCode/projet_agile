C4::Application.routes.draw do
  devise_for :users

  resource  :home, only: [:index]
  resources :achievements, only: [:show, :new, :create, :index]
  resources :users, only: [:show]
  resource  :votes, only: [:create]
  resource  :subscriptions, only: [:create]

  authenticated :user do
    root :to => 'achievements#index'
  end
  root :to => 'home#index'
end
