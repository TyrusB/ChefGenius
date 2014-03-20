ChefGenius::Application.routes.draw do
  devise_for :users
  root :to => "static_pages#home"

  namespace :api do
    resources :recipes do
      resources :needs, :shallow => true
      resources :steps, :shallow => true
    end
  end
end
