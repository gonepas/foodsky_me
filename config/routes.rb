Rails.application.routes.draw do
  get 'page/home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'page#home'
  resource :user, only: [:edit, :update]
end
