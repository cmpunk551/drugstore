Rails.application.routes.draw do
  root 'categories#index'
  resources :medicines
  resources :purchase_medicines
  resource :cart, only: [:show, :create]
  resources :purchase_confirm
  resources :purchases
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
