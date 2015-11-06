Rails.application.routes.draw do
    root 'mainpage#index'
    resources :reviews
    devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
    mount Attachinary::Engine => "/attachinary"
end
