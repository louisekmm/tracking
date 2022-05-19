Rails.application.routes.draw do
  resources :warehouse_inventoryitems
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "products#index"

  resources :products do
    resources :inventoryitems

  resources :warehouses
  resources :warehouse_inventoryitems

  end

end
