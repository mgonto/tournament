Tournament::Application.routes.draw do

  devise_for :users , :controllers => {:registrations => "registrations",
                                       :sessions => "sessions" }

  resources :sport_templates, only: [:index]
  resources :tournaments, only: [:create]                                     

end
