Rails.application.routes.draw do

<<<<<<< HEAD
<<<<<<< HEAD

  # get '/park_equipments/official', to: 'park_equipments#official'

=======
  root 'main#index'
>>>>>>> origin/Klavakurochkina
=======
  root 'main#index'
>>>>>>> origin/Klavakurochkina
  devise_for :users

  resources :park_equipments, :only => :index do
    collection do
      get 'office'
      post 'office'
      post 'search_dep'
<<<<<<< HEAD
<<<<<<< HEAD
      get 'official'
      post 'official'
=======
=======
>>>>>>> origin/Klavakurochkina
      post 'create_branch'
      get 'create_branch'
      post 'create_department'
      get 'search_office'
      post 'search_office'
      get 'add_office'
      get 'delete_office'
<<<<<<< HEAD
    end
    member do
      get 'show_office'
      get 'edit_office'
      # put 'edit_office'
      get 'show_branch'
      get 'edit_branch'
      put 'edit_branch'
<<<<<<< HEAD

>>>>>>> origin/Klavakurochkina
=======
>>>>>>> origin/Klavakurochkina
=======
    end
    member do
      get 'show_office'
      get 'edit_office'
      # put 'edit_office'
      get 'show_branch'
      get 'edit_branch'
      put 'edit_branch'
    end
  end

  resources :admin_park_equipments, :only => :index do
    collection do
      get 'department'
      # post 'department'
      get 'position'
      # post 'position'
      #

      # post 'search_dep'
      # post 'create_branch'
      # get 'create_branch'
      post 'create_department'
      post 'create_position'
      # get 'search_office'
      # post 'search_office'
      # get 'add_office'
      get 'delete_department'
      get 'delete_position'
    end
    member do
      put 'edit_department'
      put 'edit_position'
      # get 'show_office'
      # get 'edit_office'
      # # put 'edit_office'
      # get 'show_branch'
      # get 'edit_branch'
      # put 'edit_branch'
>>>>>>> origin/Klavakurochkina
    end
  end

  resources :admin_park_equipments, :only => :index do
    collection do
      get 'department'
      # post 'department'
      get 'position'
      # post 'position'
      #

      # post 'search_dep'
      # post 'create_branch'
      # get 'create_branch'
      post 'create_department'
      post 'create_position'
      # get 'search_office'
      # post 'search_office'
      # get 'add_office'
      get 'delete_department'
      get 'delete_position'
    end
    member do
      put 'edit_department'
      put 'edit_position'
      # get 'show_office'
      # get 'edit_office'
      # # put 'edit_office'
      # get 'show_branch'
      # get 'edit_branch'
      # put 'edit_branch'
    end
  end










  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
