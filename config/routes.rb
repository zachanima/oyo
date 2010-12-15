Oyo::Application.routes.draw do
  resources :pages do
    get :manage, :on => :member
    resources :elements do
      post :sort, :on => :collection
    end
    resources :texts
    resources :images
  end
  resources :links

  root :to => "pages#index"
end
