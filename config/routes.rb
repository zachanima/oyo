Oyo::Application.routes.draw do
  resources :pages do
    resources :elements do
      post :sort, :on => :collection
    end
    resources :texts
    resources :images
  end

  root :to => "pages#index"
end
