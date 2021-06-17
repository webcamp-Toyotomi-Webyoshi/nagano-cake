Rails.application.routes.draw do

  #会員側のルーティング設定
  root :to => 'homes#homes'
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  #idを非表示にさせたい
  resources :customers, only: [:show, :edit, :update]
  get 'custmers/unsubscibe' => 'users#unsubscribe'
  get 'custmers/withdraw' => 'users#withdraw'
  #--------------------
  resources :orders, only: [:index, :create, :new, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]


  #管理者側のルーティング設定
  namespace :admin do
    get 'homes' => 'homes#top'
    patch 'order_items/:id' => 'orders#update'
    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end
end
