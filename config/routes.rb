Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
