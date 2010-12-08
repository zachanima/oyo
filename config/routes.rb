Oyo::Application.routes.draw do
  resources :pages do
    resources :elements
    resources :texts
    resources :images
  end

  root :to => "pages#index"
end
