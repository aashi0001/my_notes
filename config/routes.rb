Rails.application.routes.draw do
  
  root 'notes#home'
  devise_for :users
  resources :notes do
    get :inactive, on: :member
    get :restore, on: :member
    get :trash, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
