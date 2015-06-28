Rails.application.routes.draw do
  get 'welcome/place_order'

  resources :orders
  resources :products
  resources :customers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#goto_link'

  match "/place_order" => "welcome#place_order", :via => :get, :as => :place_order
  match "/submit_order" => "welcome#submit_order", :via => :post, :as => :submit_order
  match "/view_bill/:customer_id" => "welcome#view_bill", :via => :get, :as => :view_bill

  match "/customers_list" => "welcome#customers_list", :via => :get, :as => :customers_list
  match "/customer_details/:customer_id" => "welcome#customer_details", :via => :get, :as => :customer_details
  match "/orders_list" => "welcome#orders_list", :via => :get, :as => :orders_list
  match "/change_order_status/:customer_id" => "welcome#change_order_status", :via => :put, :as => :change_order_status
  match "/destroy_order/:customer_id" => "welcome#destroy_order", :via => [:get, :post], :as => :destroy_order

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
