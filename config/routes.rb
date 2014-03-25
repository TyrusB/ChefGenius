ChefGenius::Application.routes.draw do
  root :to => "static_pages#home"

  get "/test", to: "static_pages#test"

  namespace :api do
    resources :recipes
    resources :steps
    resources :ingredients
    resources :notes
    resources :infos
    resources :annotations
  end
end
