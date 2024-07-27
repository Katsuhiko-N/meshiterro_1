Rails.application.routes.draw do
  devise_for :users
  # ルーティング自動追加
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: "about"
  
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
