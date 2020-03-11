Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'products/index'
  get 'products/new'
  get 'products/edit'

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

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  delete 'line_items/:id' => "line_items#destroy"

  resources :products
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
