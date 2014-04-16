Recycle::Application.routes.draw do
  root "pages#home"

  devise_for :users
  devise_for :admins
  
  resources :brands
  resources :products
  get "/products/:id/submit" => "products#submit"  
  resources :submissions 

  get "reclaim" => "pages#reclaim"
  get "about" => "pages#about"
  get "submissions" => "submissions#index"
  get "faq" => "pages#faq"
end
