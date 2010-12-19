ActionController::Routing::Routes.draw do |map|
  map.resources :listings do |listing|
    listing.resources :enquiries, :only => [:edit, :new] do |enquiry|
      enquiry.approve 'approve', :controller => 'listings', :action => 'approve_enquiry'
    end
  end
  map.resources :properties
  map.resources :enquiries
  map.resource :user_session

  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  map.resources :users
  
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
