Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'tasks', to: 'tasks#index'
  resource :tasks, only: [:new, :create, :edit, :update, :destroy] do
    post :complete, action: "complete"
  end

  get 'task_lists', to: 'task_lists#index'
  resource :task_lists, only: [:new, :create, :edit, :update, :destroy] do
    get  :show_tasks,  action: 'show_tasks', as: "show"
    post :add_task,    action: 'add_task'
    post :remove_task, action: 'remove_task'
  end

  get 'session', to: 'session#login'
  get 'session/create', to: 'session#create'
  get 'session/sign_out', to: 'session#sign_out'

  root to: 'session#login'
end
