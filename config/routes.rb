Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # devise_for :admins
  devise_for :users
  
  devise_for :admin, skip:[:registrations, :password], controllers:{
    sessions: 'admin/sessions'
  }
  
  # ルーティング自動追加
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: "about"
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  # admin用ルーティング
  device_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashbords', to: 'dashboards#index'
  end
  
  
  
  
  
  
  
  
  
end