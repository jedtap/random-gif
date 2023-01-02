Rails.application.routes.draw do
  resources :searches
  get 'pages/home'
  root 'pages#home'
end
