BaconTimer::Application.routes.draw do
  root :to => "timers#index"
  resources :timers, :except => [:edit, :update, :destroy, :show]
end
