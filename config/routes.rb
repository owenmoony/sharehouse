ActionController::Routing::Routes.draw do |map|
  map.resources :listings

  map.resources :properties
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route

  map.resources :users
  
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
