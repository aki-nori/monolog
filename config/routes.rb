Rails.application.routes.draw do

  root 'homes#about'
  get '/top' => 'homes#top', as: :top
  get '/manage' => 'homes#manage', as: :manage

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users,         only: [:edit, :update, :show, :index] do
    member do
      get :followings
      get :followers
    end
  end
  resources :admins
  resources :categories,    only: [:create, :destroy, :update, :show, :index]
  resources :items,         only: [:create, :destroy, :update, :show, :index, :edit, :new] do
    member do
      get :like
    end
  end
  resources :logs,          only: [:create, :destroy, :update, :edit]
  resources :likes,         only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :comments,      only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end