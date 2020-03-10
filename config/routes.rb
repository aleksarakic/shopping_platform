Rails.application.routes.draw do
  root 'sessions#new'
  get 'buyers/new', to: 'buyers#new', as: 'new_buyer'
  post 'buyers/create', to: 'buyers#create'
  get 'buyers/show'
 
  get 'suppliers/:id/shop', to: 'suppliers#shop', as: 'suppliers_shop'
  get 'suppliers/new', to: 'suppliers#new', as: 'new_supplier'
  post 'suppliers/create', to: 'suppliers#create'
  get '/suppliers/:id', to: 'suppliers#show', as: 'supplier'
  
  get 'users/new'
  post 'users/create'
  get 'users/show'
  get 'users/destroy'
  get '/users/:id', to: 'users#show', as: :user
  # delete '/users/:id', to: 'users#destroy', as: :delete_account

  get 'sign_up' => 'users#new'
  resources :sessions
  get 'log_in' => 'sessions#new'
  get 'log_out' => 'sessions#destroy'

  constraints BuyerRouteConstraint.new do
    get 'home', to: 'buyers#home', format: false
  end
  get 'home', to: 'suppliers#home', format: false
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
