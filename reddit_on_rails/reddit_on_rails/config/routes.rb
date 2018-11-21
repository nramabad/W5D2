Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :subs, except: [:destroy] do
    resources :posts, only: [:create, :new]
  end
  
  resources :posts, only: [:edit, :show, :update, :destroy]
  
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
end
