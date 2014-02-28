Hubreview::Application.routes.draw do
  root 'revisions#index'
  resources :revisions, only: [ :index ]
end
