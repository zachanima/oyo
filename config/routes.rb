Oyo::Application.routes.draw do
  resources :pages do
    resources :elements
    resources :texts
  end

  root :to => "pages#index"
end
