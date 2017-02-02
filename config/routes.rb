Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  
  get    'users/:id/edit', to: 'users#edit'
  patch  'users/:id/edit', to: 'users#update'
  put    'users/:id/edit', to: 'users#update'
  delete 'users/:id/edit', to: 'users#destroy'
  
  resources :users do
    member do
      get 'followings'
      get 'followers'
    end
  end

 resources :microposts
 
 resources :relationships, only: [:create, :destroy]

end