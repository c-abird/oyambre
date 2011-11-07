Rails.application.routes.draw do #|map|

  # session routes
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  resource :session

  # admin routes
  match "admin/overview" => "admin/inshalla#overview"
  match "admin" => redirect('/admin/overview')

  # pages routes
  namespace :admin do
    resources :pages do admin_routes end
  end

end
