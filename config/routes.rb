Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'home/mypage'
  get 'home/show'

  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
end
