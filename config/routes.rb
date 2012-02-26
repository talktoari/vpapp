Vpapp::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :donation_year_links

  resources :yearly_details do
    get "search", :on => :collection
    get "search_results", :on => :collection
    #get "remove_all", :on => :collection
    post "search", :on => :collection
    post "search_results", :on => :collection
    #post "remove_all", :on => :collection
  end

  resources :yearly_details

  get "users/index"
  get "users/new"
  get "users/show"
  get "users/edit"

  resources :students do
    get "search", :on => :collection
    get "search_results", :on => :collection
    #get "remove_all", :on => :collection
    post "search", :on => :collection
    post "search_results", :on => :collection
    #post "remove_all", :on => :collection
  end

  resources :students

  resources :donations do
    get "search", :on => :collection
    get "search_results", :on => :collection
    #get "remove_all", :on => :collection
    post "search", :on => :collection
    post "search_results", :on => :collection
    #post "remove_all", :on => :collection
  end

  resources :donations

  get "home/choosepage"

  #devise_for :users, :controllers  => { :registrations => 'my_devise/registrations' }
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  devise_for :users, :controllers  => { :registrations => 'users/registrations' }
  # http://www.tonyamoyal.com/2010/09/29/rails-authentication-with-devise-and-cancan-part-2-restful-resources-for-administrators/
  devise_for :users
  resources :users

  # Custom route for satisfying devise authentication user sign_out
  devise_scope :user do
    match 'users' => 'my_devise/registrations#index'
    get 'users/sign_out', :to => 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  resources :donors do
    get "upload_donor", :on => :collection
    get "upload_validate_donor", :on => :collection
    get "search", :on => :collection
    get "search_results", :on => :collection
    #get "remove_all", :on => :collection
    post "upload_donor", :on => :collection
    post "upload_validate_donor", :on => :collection
    post "search", :on => :collection
    post "search_results", :on => :collection
    #post "remove_all", :on => :collection
  end

  resources :donors


  get "home/index"



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match ':action' => 'home#:action'
end

