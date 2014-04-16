ChefGenius::Application.routes.draw do
  devise_for :users
  root :to => "static_pages#home"

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

  match '/send_mail', to: 'contact#send_mail', via: 'post'
end
