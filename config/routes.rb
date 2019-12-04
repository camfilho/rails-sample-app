Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
