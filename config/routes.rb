FobhgContacts::Application.routes.draw do

  resources :newsletters

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users
  resources :contacts  
  post '/import', :to => 'contacts#import'

  root :to => "home#index"
end
