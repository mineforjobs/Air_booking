ActionController::Routing::Routes.draw do |map|
 
map.resources :airports

map.connect 'users/home',:action=>'home',:controller=>'users'
map.connect 'users/login',:action=>'login',:controller=>'users'
map.connect 'users/logout',:action=>'logout',:controller=>'users'
map.connect 'users/private',:action=>'private',:controller=>'users'
map.connect 'users/edit_password',:action=>'edit_password',:controller=>'users'
map.connect 'users/update_password',:action=>'update_password',:controller=>'users'
map.resources :users

map.connect '/flights/:id/check_availability', :action=>'check_availability', :controller=>'flights'
map.connect '/flights/:id/paid', :action=>'paid', :controller=>'flights'

map.connect '/flights/:flight_id/seats', :action=>'flight_seats', :controller=>'seats'
map.connect '/flights/find',:action=>'find',:controller=>'flights'
map.connect '/flights', :controller=>'flights', :action=>'index'
map.connect '/seats', :controller=>'seats', :action=>'index'

map.connect '/seats/new', :controller=>'seats', :action=>'new'
map.connect '/seats/create', :controller=>'seats', :action=>'create'
map.connect '/seats/:id/edit', :controller=>'seats', :action=>'edit'
map.connect '/seats/:id/update', :controller=>'seats', :action=>'update'
map.connect '/seats/:id', :controller=>'seats', :action=>'show'
map.connect '/seats/:id/delete', :controller=>'seats', :action=>'delete'


map.connect '/flights/new', :controller=>'flights', :action=>'new'
map.connect '/flights/create', :controller=>'flights', :action=>'create'
map.connect '/flights/:id/edit', :controller=>'flights', :action=>'edit'
map.connect '/flights/:id/update', :controller=>'flights', :action=>'update'
map.connect '/flights/:id/payment',:action=>'payment',:controller=>'flights'
map.connect '/flights/:id', :controller=>'flights', :action=>'show'
map.connect '/flights/:id/delete', :controller=>'flights', :action=>'delete'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
