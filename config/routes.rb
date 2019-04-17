Rails.application.routes.draw do
  
  
  resources :categories
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  resources :orders do
     resources:orderitems 
  end 
  
  
  
  
  
  devise_for :users do
      resources:orders
      
  end 
  
  get '/checkout' => 'cart#createOrder'
  

      
      
      
  get 'cart/index'
  resources :products
  resources :items
  #get 'static_pages/home'
  root 'static_pages#home'
 # get 'static_pages/help'
 # get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  get '/about' =>'static_pages#about'
  get '/help' => 'static_pages#help'
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
   get '/categories' => 'layouts#categories'
  
  
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id'=> 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  

   get '/paid/:id' => 'static_pages#paid'
   
   post '/search' => 'items#search'
   
   
 get '/category/:title' => 'static_pages#category'
    
  get '/cart/decrease/:id'=> 'cart#decrease'
  get '/showuser' => "static_pages#allusers"
  
  get '/upgrade/:id' => 'static_pages#upgrade'
   get '/downgrade/:id' => 'static_pages#downgrade'
   
  get'/cart' => 'cart#index'
end
