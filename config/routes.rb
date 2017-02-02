Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
<<<<<<< HEAD

  resources :relationships, only: [:create, :destroy]
=======
  get    'users/:id/edit', to: 'users#edit'
  patch  'users/:id/edit', to: 'users#update'
  put    'users/:id/edit', to: 'users#update'
  delete 'users/:id/edit', to: 'users#destroy'
  
  resources :users
>>>>>>> user-profile
end