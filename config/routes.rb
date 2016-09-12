Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # as can be added to both get and root; it tell rails to create a store_path accessor method, you can do sth like: link_to store_path 'go to store'
  root 'store#index', as: 'store'
end
