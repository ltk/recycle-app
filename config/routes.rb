Recycle::Application.routes.draw do
  root "pages#home"

  devise_for :users
  devise_for :admins
  
  resources :brands

  resources :products
  get "/products/:id/submit" => "products#submit"  

  resources :submissions
  post "/submissions/:id/change_status" => "submissions#change_status", as: 'change_status_submission'

  get "reclaim" => "pages#reclaim"
  get "about" => "pages#about"
  get "submissions" => "submissions#index"
  get "faq" => "pages#faq"
end
