ChefGenius::Application.routes.draw do
  root :to => "static_pages#home"

  resources :recipes
end
