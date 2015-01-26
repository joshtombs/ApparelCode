Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'
  get 'people' => 'home#people'
  get 'users' => 'authentication#show_users'
  get 'posts' => 'post#show_posts'
  
  get "sign_in" => "authentication#sign_in"
  post "login" => "authentication#login"
  get "signed_out" => "authentication#signed_out"
  
  get "sign_up" => "authentication#new_user"
  put "sign_up" => "authentication#register"

  get "account_settings" => "authentication#account_settings"
  put "account_settings" => "authentication#set_account_info"

  get "forgot_password" => "authentication#forgot_password"
  put "forgot_password" => "authentication#send_password_reset_instructions"
  get "password_reset" => "authentication#password_reset"
  put "password_reset" => "authentication#new_password"

  get "current_admin" => "application#current_admin"
  get "current_user" => "application#current_user"

  get "create_post" => "post#new_post"
  put "create_post" => "post#create_post"

  resources :post, only: [:show]
  get '*path' => redirect('/')

  # namespace :admin, :module => false do
  #   get "sign_in" => "admin#sign_in"
  #   post "sign_in" => "admin#login"
  #   get "signed_out" => "admin#signed_out"
  #   get "account_settings" => "admin#account_settings"
  #   put "account_settings" => "admin#set_account_info"
  #   get "users" => "admin#users"
  #   delete "user/:id" => "admin#delete_user"
  # end
end
