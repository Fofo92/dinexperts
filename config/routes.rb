Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :experts do
    resources :memberships, only: [:index, :new, :create, :edit, :update]
  end
  resources :memberships, only: [:destroy]
  resources :bodies
  resources :membership_types
end
