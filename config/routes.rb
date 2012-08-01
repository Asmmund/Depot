Depot::Application.routes.draw do
  get 'admin' => 'admin#index'
  
  controller :sessions do
    get 'login' =>:new
    post 'login' => :create
    delete 'logout' =>:destroy
  end
  
  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items do
        post 'decrement', on: :member
    end    
    resources :carts
    resources :products do
      get :who_bought, on: :member
    end
    root to: 'store#index', as: 'store'
  end



  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
