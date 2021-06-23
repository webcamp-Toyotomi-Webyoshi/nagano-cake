Rails.application.routes.draw do

  devise_for :admin,controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_up' => 'public/registrations#new'
    post 'customers' => 'public/registrations#create'
    get 'customers/sign_in' => 'public/sessions#new'
    post '/customers/sign_in' => 'public/sessions#create'
    delete '/customers/sign_out' => 'public/sessions#destroy'
  end
  #会員側のルーティング設定
  scope module: :public do
    root :to => 'homes#homes'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
    #idを非表示にさせたい
    resource :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    #--------------------
    resources :orders, only: [:index, :create, :new, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end


  #管理者側のルーティング設定
  namespace :admin do
    get 'homes' => 'homes#top'
    get 'customer/:id/orders' => 'orders#customer_index', as: 'customer_orders'
    patch 'order_items/:id' => 'orders#update'
    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end
end
