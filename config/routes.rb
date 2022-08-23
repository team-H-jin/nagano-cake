Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:passwords], controllers:{
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end

 scope module: :public do
   root to: "homes#top"
   get 'about' => 'homes#about'
   resources :items, only: [:index,:show]

   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   get 'customers/my_page' => 'customers#show'
   get 'customers/information/edit' => 'customers#edit'
   patch 'customers/information' => 'customers#update'
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :cart_items, only: [:index,:update,:destroy,:create]
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/done' => 'orders#done'
   resources :orders, only: [:new,:create,:index,:show]
   resources :shopping_addresses, only: [:index,:edit,:create,:update,:destroy]
 end
 namespace :admin do
   root to: "homes#top"
   resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy]
   resources :genres, only: [:index,:create,:edit,:update,:destroy]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :orders, only: [:index,:show,:update]
   resources :order_details, only: [:update]
 end
end