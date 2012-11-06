C4::Application.routes.draw do
  resources :achievements
  resources :users

  root :to => 'achievements#index'
end
