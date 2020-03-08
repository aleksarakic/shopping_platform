Rails.application.routes.draw do
  get 'buyers/create'
  get 'buyers/new'
  get 'buyers/show'
  get 'suppliers/show'
  get 'suppliers/new'
  get 'suppliers/create'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/destroy'

  get '/users/:id', to: 'users#show', as: :user
  # delete '/users/:id', to: 'users#destroy', as: :delete_account
  get 'sign_up' => 'users#new'

  get 'log_in' => 'sessions#new'
  get 'log_out' => 'sessions#destroy'
  resource 'sessions'
  root 'sessions#new'

  constraints BuyerRouteConstraint.new do
    get 'home' => 'buyers#home'
  end
  get 'home', to: 'suppliers#show' # if supplier, go to user's profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
