C4::Application.routes.draw do
  devise_for :users

  resources :achievements, only: [:show, :new, :create, :index]
  resources :users, only: [:show]
  resource  :votes, only: [:create]

  root :to => 'achievements#index'
end
