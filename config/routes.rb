Recycle::Application.routes.draw do
  root "pages#home"

  devise_for :users
  devise_for :admins
  
  resources :brands do
    resources :products
  end

  resources :products
  get "/products/:id/submit" => "products#submit"  

  resources :submissions
  post "/submissions/:id/change_status" => "submissions#change_status", as: 'change_status_submission'

  get "reclaim" => "pages#reclaim"
  get "about" => "pages#about"
  get "admin" => "submissions#index"
  get "faq" => "pages#faq"
  get "about" => "pages#about"
  get "marketing" => "pages#marketing"
  get "materials" => "pages#materials"
  get "contact" => "pages#contact"
  get "dashboard" => "pages#dashboard"
  get "labels" => "pages#labels"
  
end
