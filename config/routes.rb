ChefGenius::Application.routes.draw do
  root :to => "static_pages#home"

  namespace :api do
    resources :recipes
    resources :steps
    resources :ingredients
    resources :notes
    resources :infos
    resources :annotations
  end
end
