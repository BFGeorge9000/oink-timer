BaconTimer::Application.routes.draw do
  # root :to => "timers#index"
  root :to => "timers#welcome"
  resources :timers, :except => [:edit, :update, :destroy, :show]
end
