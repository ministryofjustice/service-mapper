Archipelago::Application.routes.draw do
  devise_for :users

  resources :stories do
    collection do
      get :user_journeys_graph
      get :systems_graph
    end
    resources :story_stages do
      collection do
        post :sort
      end
    end
  end

  resources :systems

  match '/audit_trail', to: 'audits#index', via: [:get]
  get ':action', :controller => :pages
  root 'pages#index'
end
