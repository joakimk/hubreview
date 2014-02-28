Hubreview::Application.routes.draw do
  root 'revisions#index'
  resources :revisions, only: [ :index, :update ]
  resource :github, only: [ :create ]
end
