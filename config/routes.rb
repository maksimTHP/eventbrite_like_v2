Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index', as: 'index'



  get 'users/create'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/destroy'

  resources :events
end
 
