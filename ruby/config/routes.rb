Tournament::Application.routes.draw do

  devise_for :users , :controllers => {:registrations => "registrations",
                                       :sessions => "sessions" }

end
