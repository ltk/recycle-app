Recycle::Application.routes.draw do
  root "pages#home"

  devise_for :users
  devise_for :admins
  
  resources :brands
  resources :products
  get "/products/:id/submit" => "products#submit"  
  resources :submissions, only: [:show]  

  get "reclaim" => "pages#reclaim"
  get "about" => "pages#about"

end
