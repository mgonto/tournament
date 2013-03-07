Tournament::Application.routes.draw do

  devise_for :users , skip: :registrations

  resources :users, only: [:create, :destroy] do
    collection do
      post :login
    end
  end

end
