ChefGenius::Application.routes.draw do
  # User auth handled by the devise gem
  devise_for :users

  # Backbone.js initializes on our root page
  root :to => "static_pages#home"

  # API is exposed to AJAX calls from Backbone.js and will be namespaced
  namespace :api do
    resources :recipes
    resources :steps
    resources :ingredients
    resources :notes
    resources :infos
    resources :annotations
    resources :suggestions
  end

  #Static page routes
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"

  #Contact page Action Mailer
  post 'send_mail', to: 'contact#send_mail'
end
