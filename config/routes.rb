Rails.application.routes.draw do
  resources :searches
  get 'pages/home'
  get 'pages/download'
  root 'pages#home'
end
