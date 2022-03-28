Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'dashboard#index'

  get 'session', to: 'session#login'
  get 'session/create', to: 'session#create'
  get 'session/sign_out', to: 'session#sign_out'

  root to: 'session#login'
end
