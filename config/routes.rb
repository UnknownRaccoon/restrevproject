Rails.application.routes.draw do
    root 'mainpage#index'
    resources :reviews
    devise_for :admins, path_names: {sign_in: 'login', sign_out: 'logout'}
    mount Attachinary::Engine => "/attachinary"
end