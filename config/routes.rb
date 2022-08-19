Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations,:passwords], controllers:{
    sessions: "admin/sessions"
  }
 scope module: :public do
   root to: "homes#top"
   get 'about' => 'homes#about'
   resources :items, only: [:index,:show]

   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   get 'customers/my_pege' => 'customers#show'
   get 'customers/information/edit' => 'customers#edit'
   patch 'customers/information' => 'customers#update'
   resources :cart_items, only: [:index,:update,:destroy,:create]
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   resources :orders, only: [:new,:create,:index,:show]
   post 'orders/confirm' => 'orders#confirm'
   get 'orders/done' => 'orders#done'
   resources :addresses, only: [:index,:edit,:create,:update,:destroy]
 end
 namespace :admin do
   root to: "homes#top"
   resources :items, only: [:index,:new,:create,:show,:edit,:update]
   resources :genres, only: [:index,:create,:edit,:update]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :orders, only: [:index,:show,:update]
   resources :order_details, only: [:update]
 end
end