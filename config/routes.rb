Gb::Application.routes.draw do

  get "guest_book/index"
  get "guest_book/byguest"
  get "guest_book/submit"

  resources :guests
  resources :guest_session

  match "guest/register" => "guests#new"

# match "guests/login" => "guest_sessions#new"
# match "guests/logout" => "guest_sessions#destroy"
  match "login" => "guest_sessions#new"
  match "logout" => "guest_sessions#destroy"

  #match "guest/show" => 'guest_book#index'

  root :to => 'guest_book#index'

end
