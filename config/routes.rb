C4::Application.routes.draw do
  resources :achievements
  resources :users
  resource  :votes

  root :to => 'achievements#index'
end
