Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }


 scope module: :public do
   root to: "homes#top"
   get 'home/about' => 'homes#about' 
   resources :items, only: [:index,:show]
   resource :customers do
     collection do
       get :unsubscribe 
       patch :withdraw
     end
   end
   resources :customers, only: [:show,:edit,:update]
   resources :cart_items do
     collection do
       delete :destroy_all
     end
   end
   resources :cart_items, only: [:index,:update,:destroy,:create]
   resources :orders do
     collection do
       post :confirm
       get :done
     end
   end
   resources :orders, only: [:new,:create,:index,:show]
   resources :addresses, only: [:index,:edit,:create,:update,:destroy]
 end
 
 namespace :admin do
   root to: "homes#top"
   resources :items, only: [:index,:new,:create,:show,:edit,:update]
   resources :genres, only: [:index,:create,:edit,:update]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :orders, only: [:show,:update]
   resources :order_details, only: [:update]
 end
end
