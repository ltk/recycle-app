Recycle::Application.routes.draw do
  resources :brands

  devise_for :users
  root "pages#home"

  get "about" => "pages#about"
  
end
