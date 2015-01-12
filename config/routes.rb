Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'

  get "sign_in" => "authentication#sign_in"
  post "sign_in" => "authentication#login"

  get "signed_out" => "authentication#signed_out"
  get "new_user" => "authentication#new_user"
end
