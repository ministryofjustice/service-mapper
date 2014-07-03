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

  resources :comments

  root 'stories#index'
end
