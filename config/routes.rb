Gradebook::Application.routes.draw do
  root :to => 'evaluations#index'

  devise_for :users

  resources :evaluations
end
