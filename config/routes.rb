Rails.application.routes.draw do
  root 'home#index'
  resources :places

  get '/logout', to: "session#logout"
  resources :session, only: [ :new, :create]
  resources :people, only: [ :new, :index ]

  resources :invitations, only: [ :index ]

  resources :chats, path: "" do
    resources :places do
      post 'vote'
    end
    resource :invitation
  end
end
