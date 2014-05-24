Rails.application.routes.draw do
  resources :chats, path: ""

  root 'home#index'
end
