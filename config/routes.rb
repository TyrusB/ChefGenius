ChefGenius::Application.routes.draw do
  devise_for :users
  root :to => "static_pages#home"

  # Test pages for Annotatable UI 
  # get "/test", to: "static_pages#test"
  # get "/test2", to: "static_pages#test2"
  namespace :api do
    resources :recipes
    resources :steps
    resources :ingredients
    resources :notes
    resources :infos
    resources :annotations
    resources :suggestions
  end

  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
end
