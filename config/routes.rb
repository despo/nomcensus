Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resource :chat
end
