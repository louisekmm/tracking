Rails.application.routes.draw do
  resources :warehouse_inventory_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "products#index"

  resources :warehouses
  resources :warehouse_inventory_items

  resources :products do
    resources :inventory_items

  end

end
